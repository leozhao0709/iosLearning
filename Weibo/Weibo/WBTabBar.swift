//
//  WBTabBar.swift
//  Weibo
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

protocol WBTabBarDelegate {
    func tabBar(tabBar: WBTabBar, from: Int, to: Int)
}

class WBTabBar: UIView {
    
    weak var currentSelectedBtn: WBTabBarButton!
    
    weak var plusButton: UIButton!
    
    var delegate: WBTabBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    /**
     Just init different UI subviews here, no frame need here
     */
    private func setupUI() {
        self.backgroundColor = UIColor.whiteColor()
        self.addPlusBtn()
    }
    
    private func addPlusBtn() {
        let btn = UIButton(type: UIButtonType.Custom)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add")!, highlightImage: UIImage(named: "tabbar_compose_icon_add_highlighted")!)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button")!, highlightImage: UIImage(named: "tabbar_compose_button_highlighted")!)
        btn.sizeToFit()
        self.plusButton = btn
        
        self.addSubview(btn)
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        var btnX: CGFloat = 0
        let btnY: CGFloat = 0
        let btnW = self.frame.width / CGFloat(self.subviews.count)
        let btnH = self.frame.height
        
        var i = 0
        
        for tabBarButton in self.subviews {
            
            if !tabBarButton.isEqual(self.plusButton) {
                
                let button = tabBarButton as? WBTabBarButton
                
                if i == (self.subviews.count)/2 {
                    i += 1
                }
                
                btnX = CGFloat(i) * btnW
                
                
                
                button!.frame = CGRectMake(btnX, btnY, btnW, btnH)
                
                i += 1
            }
        }
        
        self.plusButton!.center = CGPointMake(self.frame.width/2, self.frame.height/2)
    }
    
    func addItem(item: UITabBarItem) {
        
        let btn = WBTabBarButton(type: .Custom)

        btn.setTitle(item.title, forState: .Normal)
        
        btn.badgeValue = item.badgeValue
        
        btn.setImage(item.image, highlightImage: item.selectedImage, selectedImage: item.selectedImage)
        
        btn.addTarget(self, action: #selector(self.btnOnClick(_:)), forControlEvents: .TouchDown)
        
        btn.tag = self.subviews.count - 1
        
        self.addSubview(btn)
    
        if btn.tag == 0 {
            self.currentSelectedBtn = btn
            btn.selected = true
        }
    }
    
    @objc private func btnOnClick(btn: WBTabBarButton) {
        
        if let delegate = self.delegate {
            delegate.tabBar(self, from: self.currentSelectedBtn.tag, to: btn.tag)
        }
        
        if btn.badgeValue != nil {
            btn.badgeValue = nil
            btn.badgeView?.removeFromSuperview()
        }
        
        
        currentSelectedBtn.selected = false
        
        btn.selected = true
        self.currentSelectedBtn = btn
        
        let scaleAni = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAni.values = [1, 0.5, 1.5, 1]
        scaleAni.duration = 0.5
        btn.layer.addAnimation(scaleAni, forKey: nil)

    }

}
