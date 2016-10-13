//
//  CZTabbar.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/8/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZTabbar: UIView {

    weak fileprivate var selectedBtn: UIButton!
    var delegate: CZTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(CZTabbar:) has not been implemented")
    }
    
    
    func addTabbarBtnWithImage(normalImage normalImg: String, selectedImage selectedImg: String) {
        
        let btn = UIButton(type: UIButtonType.custom)
        
        btn.setBackgroundImage(UIImage(named: normalImg)!, for: UIControlState())
        btn.setBackgroundImage(UIImage(named: selectedImg)!, for: UIControlState.selected)
        
        btn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchDown)
        
        btn.tag = self.subviews.count
        
        self.addSubview(btn)
        
        if btn.tag == 0 {
            self.selectedBtn = btn
            btn.isSelected = true
        }
    }
    
    @objc fileprivate func btnClick(_ btn: UIButton) {
        
        btn.isHighlighted = false
        
        if let delegate = self.delegate {
            delegate.tabbar(self, didSelectedFrom: self.selectedBtn.tag, to: btn.tag)
        }
        
        self.selectedBtn.isSelected = false
        btn.isSelected = true
        self.selectedBtn = btn
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.subviews.count
        
        let btnW = self.bounds.width / CGFloat(count)
        let btnH = self.bounds.height
        
        for btn in self.subviews {
            
            btn.frame = CGRect(x: btnW * CGFloat(btn.tag), y: 0, width: btnW, height: btnH)
        }
        
    }

}
