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
            self.singerImageView.image = UIImage(named: playingMusic.singerIcon)
            self.musicNameLabel.text = playingMusic.name
            self.singerNameLabel.text = playingMusic.singer
        }
    }
    
    
    static func loadPlayerToolBarView() -> PlayerToolBarView {
        return NSBundle.mainBundle().loadNibNamed("PlayerToolBar", owner: nil, options: nil).first as! PlayerToolBarView
    }
    
    @IBAction func playBtnClick(btn: UIButton) {
        self.isPlaying = !self.isPlaying
        
        //跳转至播放状态
        if self.isPlaying {
            
            //注意是setImage, 不是setBackgroundImage
            btn.setImage(UIImage(named: "playbar_pausebtn_nomal"), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: "playbar_pausebtn_click"), forState: UIControlState.Highlighted)

            NSLog("播放")

        }
        //跳转至暂停状态
        else {
            btn.setImage(UIImage(named: "playbar_playbtn_click"), forState: UIControlState.Highlighted)
            btn.setImage(UIImage(named: "playbar_playbtn_nomal"), forState: UIControlState.Normal)
            
            NSLog("暂停")
        }
    }

}
