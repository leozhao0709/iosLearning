//
//  CZTabBarController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/7/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZTabBarController: UITabBarController {
    
    weak private var selectedBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let mTabbar = UIView(frame: self.tabBar.bounds)
//        mTabbar.backgroundColor = UIColor.redColor()
        
        let btnW = self.tabBar.bounds.width / 5
        let btnH = self.tabBar.bounds.height
        
        //自定义按钮
        for i in 0..<5 {
            let normalImg = String(format: "TabBar%d", i + 1)
            
            let selectedImg = String(format: "TabBar%dSel", i + 1)
            
            let btn = UIButton(type: UIButtonType.Custom)
            
            btn.setBackgroundImage(UIImage(named: normalImg)!, forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: selectedImg)!, forState: UIControlState.Selected)
            
            btn.frame = CGRectMake(btnW * CGFloat(i), 0, btnW, btnH)
            
            btn.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            btn.tag = i
            
            if i == 0 {
                btn.selected = true
                self.selectedBtn = btn
            }
            
            mTabbar.addSubview(btn)
        }
        
        self.tabBar.addSubview(mTabbar)
        
        
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
    
    @objc private func btnClick(button: UIButton) {
        
        //切换tabBar
        self.selectedIndex = button.tag
        
        self.selectedBtn.selected = false
        button.selected = true
        self.selectedBtn = button
    }

}
