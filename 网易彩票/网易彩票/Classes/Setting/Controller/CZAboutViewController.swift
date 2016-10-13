//
//  CZAboutViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZAboutViewController: CZBaseSettingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item1 = CZSettingArrowItem(icon: nil, title: "评分支持")
        item1.operation = {
            
            let url = "itms-apps://itunes.apple.com/cn/app/\("725296055")?mt=8"
            UIApplication.shared.openURL(URL(string: url)!)
        }
        
        let item2 = CZSettingArrowItem(icon: nil, title: "客户电话")
        item2.subtitle = "10086"
        item2.operation = {
            let url = URL(string: "tel://10010")
            UIApplication.shared.openURL(url!)
        }
        
        let group1 = CZSettingGroup()
        group1.items = [item1, item2]
        
        self.cellData.append(group1)
    }

}
