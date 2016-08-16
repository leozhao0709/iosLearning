//
//  CZTabbar.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/8/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZTabbar: UIView {

    weak private var selectedBtn: UIButton!
    var delegate: CZTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(CZTabbar:) has not been implemented")
    }
    
    
    func addTabbarBtnWithImage(normalImage normalImg: String, selectedImage selectedImg: String) {
        
        let btn = UIButton(type: UIButtonType.Custom)
        
        btn.setBackgroundImage(UIImage(named: normalImg)!, forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: selectedImg)!, forState: UIControlState.Selected)
        
        btn.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        btn.tag = self.subviews.count
        
        self.addSubview(btn)
        
        if btn.tag == 0 {
            self.selectedBtn = btn
            btn.selected = true
        }
    }
    
    @objc private func btnClick(btn: UIButton) {
        
        btn.highlighted = false
        
        if let delegate = self.delegate {
            delegate.tabbar(self, didSelectedFrom: self.selectedBtn.tag, to: btn.tag)
        }
        
        self.selectedBtn.selected = false
        btn.selected = true
        self.selectedBtn = btn
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.subviews.count
        
        let btnW = self.bounds.width / CGFloat(count)
        let btnH = self.bounds.height
        
        for btn in self.subviews {
            
            btn.frame = CGRectMake(btnW * CGFloat(btn.tag), 0, btnW, btnH)
        }
        
    }

}
