//
//  WBProfileViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBProfileViewController: WBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.defaultCenterView?.iconImage = #imageLiteral(resourceName: "visitordiscover_image_profile")
        self.defaultCenterView?.info = "登陆后, 你的微博,相册, 个人资料会显示在这里, 展示给别人"
        self.defaultCenterView?.turnTableImageView.isHidden = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.setting))
        
    }
    
    
    @objc private func setting() {
        printLog(message: #function)
    }


}
