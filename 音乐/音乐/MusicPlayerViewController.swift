//
//  MusicPlayerViewController.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension
import AVFoundation

class MusicPlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PlayToolBarViewDelegate, AVAudioPlayerDelegate{

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    weak var playerToolBarView: PlayerToolBarView!
    
    var currentMusicIndex: Int = 0
    
    lazy var musics: NSArray = {
       let musics = Music.mj_objectArrayWithFilename("songs.plist")
        return musics
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.playerToolBarView = PlayerToolBarView.loadPlayerToolBarView()
        self.playerToolBarView.frame = self.bottomView.bounds
        self.bottomView.addSubview(self.playerToolBarView)
        
        self.playerToolBarView.delegate = self
        
        //注意这一行的顺序必须在set playingMusic之前
        MusicTool.sharedMuiscTool.prepareToPlayWithMusic(self.musics[self.currentMusicIndex] as! Music)
        
        //初始化播放的音乐
        self.playerToolBarView.playingMusic = self.musics[self.currentMusicIndex] as! Music
        
        MusicTool.sharedMuiscTool.player?.delegate = self
        
        
        //设置appdelegate block
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.playerRemoteEventClosure = { (event: UIEvent) in
            switch event.subtype {
            case .RemoteControlPlay:
                MusicTool.sharedMuiscTool.playMusic()
            case .RemoteControlPause:
                MusicTool.sharedMuiscTool.pauseMusic()
            case .RemoteControlPreviousTrack:
                self.playPreiousMusic()
            case .RemoteControlNextTrack:
                self.playNextMusic()
            default:
                break
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musics.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = MusicCell.musicCellWithTableView(tableView)
        
        let music = self.musics[indexPath.row] as! Music
        
        cell.music = music
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func playToolBarView(playToolBar: PlayerToolBarView, btnType: BtnType) {
        switch btnType {
        case .pause:
            MusicTool.sharedMuiscTool.pauseMusic()
        case .play:
            MusicTool.sharedMuiscTool.playMusic()
        case .previous:
            self.playPreiousMusic()
        case .next:
            self.playNextMusic()
        }
    }
    
    func stopCurrentMusic() {
        MusicTool.sharedMuiscTool.stopMusic()
        self.playerToolBarView.isPlaying = false
        self.playerToolBarView.singerImageViewTransformIdentity()
        self.playerToolBarView.playBtnChange()
    }
    
    func playNextMusic() {
        self.stopCurrentMusic()
        
        if self.currentMusicIndex == self.musics.count - 1 {
            self.currentMusicIndex = 0
        } else {
            self.currentMusicIndex += 1
        }
        
        self.musicPlay()
    }
    
    func playPreiousMusic() {
        self.stopCurrentMusic()
        
        if self.currentMusicIndex == 0 {
            self.currentMusicIndex = self.musics.count - 1
        } else {
            self.currentMusicIndex -= 1
        }
        
        self.musicPlay()
    }
    
    func musicPlay() {
        
        MusicTool.sharedMuiscTool.prepareToPlayWithMusic(self.musics[currentMusicIndex] as! Music)
        
        MusicTool.sharedMuiscTool.player?.delegate = self
        
        self.playerToolBarView.playingMusic = self.musics[currentMusicIndex] as! Music
        
        MusicTool.sharedMuiscTool.playMusic()
        self.playerToolBarView.isPlaying = true
        self.playerToolBarView.playBtnChange()
    }
    
    //MARK: - tableView delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == self.currentMusicIndex {
            self.playerToolBarView.isPlaying = !self.playerToolBarView.isPlaying
            self.playerToolBarView.playBtnChange()
        }
        else {
            self.stopCurrentMusic()
            self.currentMusicIndex = indexPath.row
            
            self.musicPlay()
        }
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: AVAudioDelegate
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        self.playNextMusic()
    }

}
