//
//  ViewController.swift
//  录音
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recorder: AVAudioRecorder!
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var data:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecord(sender: UIButton) {
        NSLog(#function)
        do {
            //url 是保存本地的地址
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyyMMddHHmmss"
            let timeStr = dateFormatter.stringFromDate(NSDate())
            
            let audioName = timeStr.stringByAppendingString(".caf")
            
            //doc 目录
            let doc = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
            
            //拼接url
            let fileUrl = doc?.stringByAppendingString("/\(audioName)")
            NSLog("\(fileUrl)")
            
            //保存路径
            self.data.append(fileUrl!)
            
            //录音时的设置,基本固定格式
            let settings: [String : AnyObject] = [AVFormatIDKey:NSNumber(unsignedInt: kAudioFormatAppleIMA4), AVSampleRateKey: 8000.0, AVNumberOfChannelsKey: 1, AVLinearPCMBitDepthKey: 8]
            
            try self.recorder = AVAudioRecorder(URL: NSURL(fileURLWithPath: fileUrl!), settings: settings)
            
            
            defer {
                self.recorder.prepareToRecord()
                
                self.recorder.record()
            }
            
        } catch let error as NSError {
            NSLog("find error: \(error)")
        }
        
    }
    
    @IBAction func stopRecord(sender: UIButton) {
        NSLog(#function)
        
//        //判断录音时间
//        let duration = self.recorder.currentTime
        
        self.recorder.stop()
        
        do {
            try self.player = AVAudioPlayer(contentsOfURL: self.recorder.url)
        } catch let error as NSError {
            NSLog("find error: \(error)")
        }
        
        if self.player.duration <= 0.5 {
            NSLog("录音时间太短")
            self.data.removeLast()
            return
        }
        
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "Record"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        
        cell?.textLabel?.text = String(NSString(string: self.data[indexPath.row]).lastPathComponent)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let fileUrl = self.data[indexPath.row]
        NSLog("select url:  \(fileUrl)")
        
        do {
            self.player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileUrl))
            self.player.prepareToPlay()
            self.player.play()
        } catch let error as NSError {
            NSLog("find error: \(error)")
        }
    }
}

