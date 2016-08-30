//
//  ViewController.swift
//  视频播放
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let avPlayerController = AVPlayerViewController()
        
        let avPlayer = AVPlayer(URL: NSBundle.mainBundle().URLForResource("promo_full.mp4", withExtension: nil)!)
        
        avPlayerController.player = avPlayer
        
        avPlayer.play()
        
        self.presentViewController(avPlayerController, animated: true) {
            let image = self.takeScreenShot(NSBundle.mainBundle().URLForResource("promo_full.mp4", withExtension: nil)!)
            self.imageView.image = image
        }
        
        let center = NSNotificationCenter.defaultCenter()
        //监听视频播放完成
        center.addObserver(self, selector: #selector(self.exit), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        
    }
    
    @objc private func exit() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func takeScreenShot(sourceURL: NSURL) -> UIImage{
        let asset = AVAsset.init(URL: sourceURL)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        let time = CMTimeMake(30, 3) //CMTimeMake(a,b) a当前第几帧, b每秒钟多少帧.当前播放时间a/b CMTimeMake(60, 30);MTimeMake(30, 15); 在这两个例子中所表示在影片中的时间都皆为2秒钟,但是影隔播放速率则不同, 相差了有两倍.
        
        let imageRef = try! imageGenerator.copyCGImageAtTime(time, actualTime: nil)
        let thumbnail = UIImage(CGImage: imageRef)
        
        return thumbnail
    }
    

}

