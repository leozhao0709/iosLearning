//
//  CZTabBarController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/7/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZTabBarController: UITabBarController, CZTabbarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        //系统的tabbarbutton图片一般是 30 * 30
//        
        let mTabbar = CZTabbar(frame: self.tabBar.bounds)
        
        //自定义按钮
        for i in 0..<5 {
            let normalImg = String(format: "TabBar%d", i + 1)
            
            let selectedImg = String(format: "TabBar%dSel", i + 1)
            
            mTabbar.addTabbarBtnWithImage(normalImage: normalImg, selectedImage: selectedImg)
            
        }
        
        mTabbar.delegate = self
        
        self.tabBar.addSubview(mTabbar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabbar(_ tabbar: CZTabbar, didSelectedFrom from: Int, to: Int) {
        self.selectedIndex = to
    }
    
    
    

}
