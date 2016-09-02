//
//  PlayerToolBar.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class PlayerToolBarView: UIView {

    
    
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    
    var isPlaying: Bool = false
    
    var playingMusic: Music! {
        didSet {
            
            let singerImage = UIImage(named: playingMusic.singerIcon)!
            
            self.singerImageView.image = singerImage.circleImageWithBorder(border: 5.0, color: UIColor.yellowColor())

            self.musicNameLabel.text = playingMusic.name
            self.singerNameLabel.text = playingMusic.singer
        }
    }
    
    
    static func loadPlayerToolBarView() -> PlayerToolBarView {
        return NSBundle.mainBundle().loadNibNamed("PlayerToolBar", owner: nil, options: nil).first as! PlayerToolBarView
    }
    
    @IBAction func playBtnClick(btn: UIButton) {
        
        //正在播放,跳转至暂停状态
        if self.isPlaying {
            
            btn.setImageButton(UIImage(named: "playbar_playbtn_nomal")!, highlightImage: UIImage(named: "playbar_playbtn_click")!)

            NSLog("暂停")

        }
        //正暂停, 跳转至播放状态
        else {
            
            btn.setImageButton(UIImage(named: "playbar_pausebtn_nomal")!, highlightImage: UIImage(named: "playbar_pausebtn_click")!)
            
            NSLog("播放")
        }
        
        self.isPlaying = !self.isPlaying
    }

}
