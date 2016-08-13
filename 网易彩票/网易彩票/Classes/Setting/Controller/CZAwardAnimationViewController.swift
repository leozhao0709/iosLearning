//
//  CZAwardAnimationViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZAwardAnimationViewController: CZBaseSettingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item1 = CZSettingSwitchItem(icon: nil, title: "中奖动画", vcClass: ViewController.self)
        
        
        let group1 = CZSettingGroup()
        group1.headerTitle = "当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。"
        group1.items = [item1]
        
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
