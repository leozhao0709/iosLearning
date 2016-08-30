//
//  CZMoviePlayerViewController.swift
//  视频播放
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

protocol CZMoviePlayerViewControllerDelegate {
    func moviePlayerViewController(viewController: CZMoviePlayerViewController, didFinishCaptureImage image: UIImage)
}

class CZMoviePlayerViewController: UIViewController {

    let movieController = MPMoviePlayerController()
    
    var movieURL: NSURL?
    var captureTimes: [Double]?
    var delegate: CZMoviePlayerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        MPMoviePlayerController deprecated at iOS 9
        
        assert(self.movieURL != nil, "请先设置movie的url")
        
        self.movieController.contentURL = self.movieURL
        
        
        //必须设置view的尺寸
        self.movieController.view.frame = self.view.bounds
        
        //屏幕适配
        self.movieController.view.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        
        self.view.addSubview(self.movieController.view)
        
        self.movieController.prepareToPlay()
        self.movieController.play()
        
        let center = NSNotificationCenter.defaultCenter()
        //监听Done事件 通过通知的方式实现
        center.addObserver(self, selector: #selector(self.exit), name: MPMoviePlayerDidExitFullscreenNotification, object: nil)
        
        //监听视频播放完成
        center.addObserver(self, selector: #selector(self.exit), name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
        
        //截屏
        if let captureTimes = self.captureTimes {
            self.movieController.requestThumbnailImagesAtTimes(captureTimes, timeOption: MPMovieTimeOption.Exact)
            center.addObserver(self, selector: #selector(self.captureImage(_:)), name: MPMoviePlayerThumbnailImageRequestDidFinishNotification, object: nil)
        }
        
        
        
//        // iOS 9 AVKit
//        let avPlayerController = AVPlayerViewController()
//        
//        let avPlayer = AVPlayer(URL: movieURL!)
//        
//        avPlayerController.player = avPlayer
//        
//        avPlayerController.view.frame = self.view.bounds
//        self.view.addSubview(avPlayerController.view)
//        
//        avPlayer.play()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc private func exit() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func captureImage(notification: NSNotification) {
        NSLog("\(notification.userInfo)")
        
        if let delegate = self.delegate {
            
            let img = notification.userInfo![MPMoviePlayerThumbnailImageKey] as! UIImage
            
            delegate.moviePlayerViewController(self, didFinishCaptureImage: img)
        }
        
    }

}

