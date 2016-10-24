//
//  WBTabBar.swift
//  Weibo
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

protocol WBTabBarDelegate {
    func tabBar(_ tabBar: WBTabBar, from: Int, to: Int)
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
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.white
        self.addPlusBtn()
    }
    
    fileprivate func addPlusBtn() {
        let btn = UIButton(type: UIButtonType.custom)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add")!, highlightImage: UIImage(named: "tabbar_compose_icon_add_highlighted")!)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button")!, highlightImage: UIImage(named: "tabbar_compose_button_highlighted")!)
        btn.sizeToFit()
        
        btn.addTarget(self, action: #selector(self.plusBtnClick), for: .touchUpInside)
        
        self.plusButton = btn
        
        self.addSubview(btn)
    }
    
    @objc private func plusBtnClick() {
        
        let window = UIApplication.shared.keyWindow
        let composeVc = WBComposeViewController(nibName: "WBComposeViewController", bundle: nil)
//        let composeVc = WBComposeViewController()
        let nav = WBNavigationController(rootViewController: composeVc)
        
        window?.rootViewController?.present(nav, animated: true, completion: nil)
        
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
                
                
                
                button!.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
                
                i += 1
            }
        }
        
        self.plusButton!.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
    }
    
    func addItem(_ item: UITabBarItem) {
        
        let btn = WBTabBarButton(type: .custom)

        btn.setTitle(item.title, for: UIControlState())
        
        btn.badgeValue = item.badgeValue
        
        btn.setImage(item.image, highlightImage: item.selectedImage, selectedImage: item.selectedImage)
        
        btn.addTarget(self, action: #selector(self.btnOnClick(_:)), for: .touchDown)
        
        btn.tag = self.subviews.count - 1
        
        self.addSubview(btn)
    
        if btn.tag == 0 {
            self.currentSelectedBtn = btn
            btn.isSelected = true
        }
    }
    
    @objc fileprivate func btnOnClick(_ btn: WBTabBarButton) {
        
        if let delegate = self.delegate {
            delegate.tabBar(self, from: self.currentSelectedBtn.tag, to: btn.tag)
        }
        
        if btn.badgeValue != nil {
            btn.badgeValue = nil
            btn.badgeView?.removeFromSuperview()
        }
        
        
        currentSelectedBtn.isSelected = false
        
        btn.isSelected = true
        self.currentSelectedBtn = btn
        
        let scaleAni = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAni.values = [1, 0.5, 1.5, 1]
        scaleAni.duration = 0.5
        btn.layer.add(scaleAni, forKey: nil)

    }

}
