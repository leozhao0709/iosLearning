//
//  ViewController.swift
//  听书(歌词同步)
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension
import AVFoundation

class ViewController: UITableViewController, AVAudioPlayerDelegate {

    lazy var words: NSMutableArray = {
        return CZWord.mj_objectArrayWithFilename("一东.plist")
    }()
    
    var bgMusicPlayer: AVAudioPlayer?
    var wordsPlayer: AVAudioPlayer?
    
    lazy var link: CADisplayLink = {
        return CADisplayLink(target: self, selector: #selector(self.update))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        NSLog("\(self.words)")
        
        let bgMusicURL = NSBundle.mainBundle().URLForResource("Background.caf", withExtension: nil)
        let wordsURL = NSBundle.mainBundle().URLForResource("一东.mp3", withExtension: nil)
        
        do {
            try self.bgMusicPlayer = AVAudioPlayer(contentsOfURL: bgMusicURL!)
            try self.wordsPlayer = AVAudioPlayer(contentsOfURL: wordsURL!)
            
            defer {
                self.bgMusicPlayer?.numberOfLoops = Int.max
                self.bgMusicPlayer?.prepareToPlay()
                self.bgMusicPlayer?.play()
                
                self.wordsPlayer?.delegate = self
                self.wordsPlayer?.prepareToPlay()
                self.wordsPlayer?.play()
                
                //同步诗词
                self.link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
            }
            
        } catch let error as NSError {
            NSLog("find error: \(error)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "Word"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        
        cell?.textLabel?.text = self.words[indexPath.row].text
        
        return cell!
    }

    
    @objc private func update() {
        let currentTime = self.wordsPlayer?.currentTime
        
        
        for i in (0..<self.words.count).reverse() {
            let word = self.words[i] as! CZWord
            if currentTime > NSTimeInterval(word.time) {
                NSLog("current time: \(currentTime)")
                NSLog("word time: \(word.time)")
                NSLog("当前索引为\(i)")
                self.selectedCellWithIndex(i)
                break;
            }
        }
    }
    
    func selectedCellWithIndex(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Middle)
    }
    
    //MARK: - AudioPlayer delegate
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        self.bgMusicPlayer?.stop()
        
        //移除定时器
        self.link.removeFromRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }

}

