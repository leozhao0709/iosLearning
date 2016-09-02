//
//  MusicPlayerViewController.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension

class MusicPlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var musics: NSArray = {
       let musics = Music.mj_objectArrayWithFilename("songs.plist")
        return musics
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let playerToolBarView = PlayerToolBarView.loadPlayerToolBarView()
        playerToolBarView.frame = self.bottomView.bounds
        self.bottomView.addSubview(playerToolBarView)
        
        //初始化播放的音乐
        playerToolBarView.playingMusic = self.musics[0] as! Music
        
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
        return 44
    }

}
