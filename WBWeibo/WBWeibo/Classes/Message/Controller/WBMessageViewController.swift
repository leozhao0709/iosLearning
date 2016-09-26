//
//  WBMessageViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBMessageViewController: WBBaseTableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.defaultCenterView?.iconImage = #imageLiteral(resourceName: "visitordiscover_image_message")
        self.defaultCenterView?.info = "登陆后, 别人评论你的微博, 给你发消息, 都会在这里收到通知"
        self.defaultCenterView?.turnTableImageView.isHidden = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送消息", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.compose))
        
    }
    
    @objc private func compose() {
        printLog(#function)
    }

}
