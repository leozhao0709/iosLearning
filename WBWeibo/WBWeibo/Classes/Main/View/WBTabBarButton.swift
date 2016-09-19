//
//  WBTabBarButton.swift
//  Weibo
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBTabBarButton: UIButton {
    
    var badgeValue:String?
    
    weak var badgeView: WBBadgeView!
    
    override var isHighlighted: Bool {
        set{}
        get {
            return super.isHighlighted
        }
    }
    
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
        self.imageView?.contentMode = .center
        self.titleLabel?.textAlignment = .center
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.setTitleColor(UIColor.black, highlightColor: UIColor.orange, selectedColor: UIColor.orange)
        
        let badgeView = WBBadgeView()
        self.badgeView = badgeView
        self.addSubview(self.badgeView!)
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        if let badgeValue = self.badgeValue {
            self.badgeView.badgeValue = badgeValue
            self.badgeView.x = self.frame.width - (self.badgeView?.frame.width)! - 12
            self.badgeView.y = 0
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        
        let imageX: CGFloat = 0;
        let imageY: CGFloat = 3;
        let imageW = self.bounds.width;
        let imageH = self.bounds.height * 0.6;
        
        return CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX: CGFloat = 0
        let titleY: CGFloat = self.bounds.height * 0.6
        let titleW = self.bounds.width
        let titleH = self.bounds.height * 0.4
        
        return CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
    }
}
