//
//  ViewController.swift
//  长音频
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var musicLabel: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    
    private var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mp3Url = NSBundle.mainBundle().URLForResource("bbqne.mp3", withExtension: nil)
        do {
            try self.player = AVAudioPlayer(contentsOfURL: mp3Url!)
            
            self.player.prepareToPlay()
            self.player.enableRate = true
            
            //0表示1次,1表示2次
            self.player.numberOfLoops = 0
            
            self.player.delegate = self
        }
        catch let error as NSError{
            NSLog("find error: \(error)")
        }
        
        self.timeSlider.maximumValue = Float(self.player.duration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopBtnClick(sender: UIButton) {
        self.player.stop()
        
        self.player.currentTime = 0
    }
    
    @IBAction func playBtnClick(sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func pauseBtnClick(sender: UIButton) {
        self.player.pause()
    }
    
    @IBAction func timeChange(sender: UISlider) {
//        NSLog("\(sender.value)")
        
        self.player.currentTime = NSTimeInterval(sender.value)
    }
    
    @IBAction func speedChange(sender: UISlider) {
        
        //需要设置enableRate
        self.player.rate = sender.value
    }
    
    @IBAction func volumeChange(sender: UISlider) {
        
        self.player.volume = sender.value
    }
    
    //MARK: - AVAudioPlayer代理方法
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
    }
    
    func audioPlayerBeginInterruption(player: AVAudioPlayer) {
        
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
        
    }

}

