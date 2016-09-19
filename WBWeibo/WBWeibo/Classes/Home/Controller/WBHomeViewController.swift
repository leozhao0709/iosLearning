//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBHomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_friendsearch"), highlightImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(self.friendSearch))
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_pop"), highlightImage: UIImage(named: "navigationbar_pop_highlighted"), target: self, action: #selector(self.scan))
        
        let titleBtn = WBTitleButton()
        titleBtn.setTitle("首页", for: .normal)
        titleBtn.setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), highlightImage: nil, selectedImage: #imageLiteral(resourceName: "navigationbar_arrow_up"))
        titleBtn.addTarget(self, action: #selector(self.titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        
        self.navigationItem.titleView = titleBtn
        
    }
    
    @objc private func titleBtnClick(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc fileprivate func friendSearch() {
        printLog(#function)
    }
    
    @objc fileprivate func scan() {
        printLog(#function)
        
        let scanVC = WBScanViewController()
        self.present(scanVC, animated: true, completion: nil)
    }

}
