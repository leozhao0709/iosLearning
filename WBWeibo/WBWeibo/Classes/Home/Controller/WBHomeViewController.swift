//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseTableViewController {
    
    weak var titleBtn: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNav()
        
        self.defaultCenterView?.iconImage = #imageLiteral(resourceName: "visitordiscover_feed_image_house")
        self.defaultCenterView?.info = "当你关注一些人以后, 他们发布的最新消息会显示在这里"
        
    }
    
    private func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_friendsearch"), highlightImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(self.friendSearch))
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_pop"), highlightImage: UIImage(named: "navigationbar_pop_highlighted"), target: self, action: #selector(self.scan))
        
        let titleBtn = WBTitleButton()
        titleBtn.setTitle("首页", for: .normal)
        titleBtn.setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), highlightImage: nil, selectedImage: #imageLiteral(resourceName: "navigationbar_arrow_up"))
        titleBtn.sizeToFit()
        titleBtn.addTarget(self, action: #selector(self.titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        
        self.navigationItem.titleView = titleBtn
        
        self.titleBtn = titleBtn
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultCenterView?.startTurnTableRotate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.defaultCenterView?.stopTurnTableRotate()
    }

    
    @objc private func titleBtnClick(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        
        let menuView = WBHomeMenuView()
        
        WBPopMenu.popFromView(fromView: btn, menuContentView: menuView) {
            btn.isSelected = !btn.isSelected
        }
        
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
