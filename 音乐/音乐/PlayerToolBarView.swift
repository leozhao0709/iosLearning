//
//  PlayerToolBar.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

enum BtnType {
    case pause
    case play
    case previous
    case next
}

protocol PlayToolBarViewDelegate {
    func playToolBarView(playToolBar: PlayerToolBarView, btnType: BtnType)
}

class PlayerToolBarView: UIView {

    
    
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var curentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!

    
    
    var isPlaying: Bool = false
    
    var delegate: PlayToolBarViewDelegate?
    
    var isDraging: Bool = false
    
    //定时器
    lazy var link: CADisplayLink? = {
       
        let _link = CADisplayLink(target: self, selector: #selector(self.update))
        
//        _link.frameInterval = 60
        
        return _link
        
    }()
    
    //更新进度条
    @objc private func update() {
        if self.isPlaying {
            
            if !self.isDraging {
                self.timeSlider.value = Float(((MusicTool.sharedMuiscTool.player?.currentTime)!))
                self.curentTimeLabel.text = MusicTool.sharedMuiscTool.player?.currentTime.converToMinuteSecondWithSecond()
                //头像转动
                let angle = CGFloat(M_PI_4/60)
                self.singerImageView.transform = CGAffineTransformRotate(self.singerImageView.transform, angle)
            }
        }
    }
    
    
    override func awakeFromNib() {
        self.timeSlider.setThumbImage(UIImage(named: "playbar_slider_thumb"), forState: UIControlState.Normal)
        self.timeSlider.value = 0
        self.link?.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }
    
    var playingMusic: Music! {
        didSet {
            
            let singerImage = UIImage(named: playingMusic.singerIcon)!
            
            self.singerImageView.image = singerImage.circleImageWithBorder(border: 5.0, color: UIColor.yellowColor())

            self.musicNameLabel.text = playingMusic.name
            self.singerNameLabel.text = playingMusic.singer
            
            self.totalTimeLabel.text = MusicTool.sharedMuiscTool.player?.duration.converToMinuteSecondWithSecond()
            
            self.timeSlider.maximumValue = Float((MusicTool.sharedMuiscTool.player?.duration)!)
            self.timeSlider.value = 0
        }
    }
    
    
    static func loadPlayerToolBarView() -> PlayerToolBarView {
        return NSBundle.mainBundle().loadNibNamed("PlayerToolBar", owner: nil, options: nil).first as! PlayerToolBarView
    }
    
    @IBAction func playBtnClick(btn: UIButton) {

        self.isPlaying = !self.isPlaying
        
        self.playBtnChange()
    }
    
    @IBAction func previousBtnClick(sender: UIButton) {
        self.notifyDelegateWithBtnType(.previous)
    }
    
    @IBAction func nextBtnClick(sender: UIButton) {
        self.notifyDelegateWithBtnType(.next)
    }
    
    func playBtnChange() {
        
        if self.isPlaying {
            self.playButton.setImageButton(UIImage(named: "playbar_pausebtn_nomal")!, highlightImage: UIImage(named: "playbar_pausebtn_click")!)
            
            self.notifyDelegateWithBtnType(.play)
            
        }

        else {
            
            self.playButton.setImageButton(UIImage(named: "playbar_playbtn_nomal")!, highlightImage: UIImage(named: "playbar_playbtn_click")!)
            
            self.notifyDelegateWithBtnType(.pause)
            
            
        }
        
    }
    
    func singerImageViewTransformIdentity() {
        self.singerImageView.transform = CGAffineTransformIdentity
    }
    
    func notifyDelegateWithBtnType(btnType: BtnType) {
        if let delegate = self.delegate {
            delegate.playToolBarView(self, btnType: btnType)
        }
    }
    
    @IBAction func slideChange(sender: UISlider) {
        
        self.curentTimeLabel.text = NSTimeInterval(sender.value).converToMinuteSecondWithSecond()
    }
    
    @IBAction func slideTouchDown(sender: UISlider) {
//        MusicTool.sharedMuiscTool.player?.pause()
        
        self.isDraging = true
        
        NSLog("touch down now")
    }
    
    @IBAction func slideTouchUp(sender: UISlider) {
//        MusicTool.sharedMuiscTool.player?.play()
        
        self.isDraging = false
        
        MusicTool.sharedMuiscTool.player?.currentTime = NSTimeInterval(sender.value)
    }
    
    
    deinit{
         self.link?.removeFromRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }
}
