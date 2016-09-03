//
//  MusicTool.swift
//  音乐
//
//  Created by Lei Zhao on 9/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MusicTool: NSObject {
    
    static let sharedMuiscTool = MusicTool()
    
    var player: AVAudioPlayer?
    
    func prepareToPlayWithMusic(music: Music) {
        
        let musicURL = NSBundle.mainBundle().URLForResource(music.filename, withExtension: nil)
        
        do {
            self.player = try AVAudioPlayer(contentsOfURL: musicURL!)
            self.player?.prepareToPlay()
        }
        catch let error as NSError {
            NSLog("error find in MusicTool: \(error)")
        }
        
        //设置锁屏音乐信息, 不过建议写在appdelegate 进入后台部分
        
        var info: [String: AnyObject] = [:]
        
        //专辑名称
        info[MPMediaItemPropertyAlbumTitle] = "中文十大金曲"
        
        //设置歌手
        info[MPMediaItemPropertyArtist] = music.singer
        
        //设置歌曲
        info[MPMediaItemPropertyTitle] = music.name
        
        //设置图片
        let image = UIImage(named: music.icon)
        info[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(image: image!)
        
        //设置时间
        info[MPMediaItemPropertyPlaybackDuration] = self.player?.duration
        
        //设置完成,但还需要在appdelegate里设置远程事件
        MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = info
    }
    
    func playMusic() {
        self.player?.play()
    }
    
    func pauseMusic() {
        self.player?.pause()
    }
    
    func stopMusic() {
        self.player?.stop()
    }
    
}
