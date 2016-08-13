//
//  CZSettingViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/10/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import KRProgressHUD

class CZSettingViewController: CZBaseSettingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "设置"
        
        //第一组
        let item1 = CZSettingArrowItem(icon: "MorePush", title: "推送和提醒", vcClass: CZPushAndWarningViewController.self)
        let item2 = CZSettingSwitchItem(icon: "handShake", title: "摇一摇机选")
        let item3 = CZSettingSwitchItem(icon: "sound_Effect", title: "声音和效果")
        
        let group1 = CZSettingGroup()
        group1.items = [item1, item2, item3]
        
        self.cellData.append(group1)
        
        //第二组
        let item4 = CZSettingArrowItem(icon: "MoreUpdate", title: "检查版本更新")
        item4.operation = {
            
            let info =  NSBundle.mainBundle().infoDictionary!
            
            NSLog("\(info["CFBundleShortVersionString"]!)")
            
            let localVersion = info["CFBundleShortVersionString"]!
            
            //            NSLog("正在检查版本更新")
            
            KRProgressHUD.show(message: "正在检查版本", progressHUDStyle: .Black)
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                
                KRProgressHUD.showSuccess(message: "当前版本已是最新", progressHUDStyle: .Black)
                KRProgressHUD.dismiss()
            })
        }
        
        let item5 = CZSettingArrowItem(icon: "MoreHelp", title: "帮助")
        let item6 = CZSettingArrowItem(icon: "MoreShare", title: "分享")
        let item7 = CZSettingArrowItem(icon: "MoreMessage", title: "查看消息")
        let item8 = CZSettingArrowItem(icon: "MoreNetease", title: "产品推荐")
        let item9 = CZSettingArrowItem(icon: "MoreAbout", title: "关于")
        
        let group2 = CZSettingGroup()
        group2.items = [item4, item5, item6, item7, item8, item9]
        
        self.cellData.append(group2)
    }

}
