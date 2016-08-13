//
//  CZAwardNumPushViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZAwardNumPushViewController: CZBaseSettingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item1 = CZSettingSwitchItem(icon: nil, title: "双色球", vcClass: ViewController.self)
        let item2 = CZSettingSwitchItem(icon: nil, title: "大乐透", vcClass: ViewController.self)

        
        let group1 = CZSettingGroup()
        group1.headerTitle = "打开设置即可在开奖后立即收到推送消息，获知开奖号码"
        group1.items = [item1, item2]
        
        self.cellData.append(group1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
