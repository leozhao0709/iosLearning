//
//  WBTabBar.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBTabBarSystem: UITabBar {
    
    var btn: UIButton?
    
    weak var plusButton: UIButton? {
        
        if self.btn == nil  {
            self.btn = UIButton(type: UIButtonType.Custom)
            
            self.btn!.setImage(UIImage(named: "tabbar_compose_icon_add")!, highlightImage: UIImage(named: "tabbar_compose_icon_add_highlighted")!)
            
            self.btn!.setBackgroundImage(UIImage(named: "tabbar_compose_button")!, highlightImage: UIImage(named: "tabbar_compose_button_highlighted")!)
            
            self.btn!.sizeToFit()
            
            self.addSubview(self.btn!)
            
        }
        
        return self.btn
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var btnX: CGFloat = 0
        let btnY: CGFloat = 0
        let btnW = self.frame.width / CGFloat((self.items?.count)! + 1)
        let btnH = self.frame.height
        
        var i = 0
        
        for tabBarButton in self.subviews {
//            if tabBarButton .isKindOfClass(NSClassFromString("UITabBarButton")!) {
            printLog("\(tabBarButton.superclass)")
            if tabBarButton .isKindOfClass(UIControl) {
            
                if i == (self.items?.count)!/2 {
                    i += 1
                }
                
                btnX = CGFloat(i) * btnW
                
                
                tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH)
                
                i += 1
            }
        }
        
        self.plusButton!.center = CGPointMake(self.frame.width/2, self.frame.height/2)
        
    }

}
