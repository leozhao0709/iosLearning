//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBHomeViewController: UITableViewController {

    var popMenuWindow: UIWindow?
    
    weak var titleBtn: UIButton?
    
    weak var testBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_friendsearch"), highlightImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(self.friendSearch))
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_pop"), highlightImage: UIImage(named: "navigationbar_pop_highlighted"), target: self, action: #selector(self.scan))
        
        let titleBtn = WBTitleButton()
        titleBtn.setTitle("首页", for: .normal)
        titleBtn.setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), highlightImage: nil, selectedImage: #imageLiteral(resourceName: "navigationbar_arrow_up"))
        titleBtn.sizeToFit()
        titleBtn.addTarget(self, action: #selector(self.titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        
        self.navigationItem.titleView = titleBtn
        
        self.titleBtn = titleBtn
        
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("My Card", for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.sizeToFit()
        btn.center = CGPoint(x: 100, y: 100)
        view.addSubview(btn)
        view.bringSubview(toFront: btn)
        view.backgroundColor = UIColor.red
//        view.addSubview(btn)
        self.testBtn = btn
        self.view.addSubview(view)
    }
    
    
    /// popup menu (use UIWindow)
    ///
    /// - parameter fromView: menu point view
    /// - parameter content:  menu content view
    func popFromConetnt(fromView: UIView, content: UIView) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.isHidden = false
        window.windowLevel = UIWindowLevelAlert
        self.popMenuWindow = window
        
        let cover = UIButton(frame: UIScreen.main.bounds)
        cover.backgroundColor = UIColor.clear
        cover.addTarget(self, action: #selector(self.coverClick), for: UIControlEvents.touchUpInside)
        window.addSubview(cover)
        
//        let menuView = UIImageView()
//        menuView.isUserInteractionEnabled = true
//        let image = #imageLiteral(resourceName: "popover_background")
//        menuView.image = image
//        
//        cover.addSubview(menuView)
//        
//        content.x = 15
//        content.y = 18
//        menuView.addSubview(content)
//        
//        let menuViewW = content.frame.maxX + content.x
//        let menuViewH = content.frame.maxY + content.y
//        menuView.frame = CGRect(x: 0, y: 0, width: menuViewW, height: menuViewH)
        
        let menuView = WBHomeMenuView()
        cover.addSubview(menuView)
        
        let resultFrame = window.convert(fromView.frame, from: fromView.superview)
        menuView.y = resultFrame.maxY
        menuView.centerX = resultFrame.origin.x + resultFrame.size.width * 0.5
    }
    
    func popMenu(fromView view: UIView, menuView: UIView) {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black
        view.addSubview(menuView)
        
        self.view.addSubview(view)
        
        self.view.bringSubview(toFront: view)
    }
    
    @objc private func coverClick() {
        self.popMenuWindow = nil
        self.titleBtn?.isSelected = !(self.titleBtn?.isSelected)!
    }
    
    @objc private func titleBtnClick(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        
        let tb = UITableView()
        tb.frame.size = CGSize(width: 150, height: 200)
        
//        self.popFromConetnt(fromView: self.testBtn!, content: tb)
        self.popFromConetnt(fromView: btn, content: tb)
        
//        let menuView = WBHomeMenuView()
//        self.popMenu(fromView: btn, menuView: menuView)
        
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
