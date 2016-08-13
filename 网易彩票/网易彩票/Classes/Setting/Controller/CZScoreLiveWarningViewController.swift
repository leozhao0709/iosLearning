//
//  CZScoreLiveWarningViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZScoreLiveWarningViewController: CZBaseSettingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item1 = CZSettingSwitchItem(icon: nil, title: "提醒我关注的比赛", vcClass: ViewController.self)
        
        
        let group1 = CZSettingGroup()
        group1.footerTitle = "当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒"
        group1.items = [item1]
        
        self.cellData.append(group1)
        
        
        let item2 = CZSettingLabelItem(icon: nil, title: "起始时间", vcClass: ViewController.self)
        
        
        let group2 = CZSettingGroup()
        group2.headerTitle = "只在以下时间接受比分直播"
        group2.items = [item2]
        
        self.cellData.append(group2)
        
        
        let item3 = CZSettingLabelItem(icon: nil, title: "结束时间", vcClass: ViewController.self)
        
        
        let group3 = CZSettingGroup()
        group3.items = [item3]
        
        self.cellData.append(group3)
    }

}
