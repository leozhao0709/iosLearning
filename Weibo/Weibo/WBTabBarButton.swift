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
    
    override var highlighted: Bool {
        set{}
        get {
            return super.highlighted
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
    private func setupUI() {
        self.imageView?.contentMode = .Center
        self.titleLabel?.textAlignment = .Center
        
        self.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.setTitleColor(UIColor.blackColor(), highlightColor: UIColor.orangeColor(), selectedColor: UIColor.orangeColor())
        
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
            self.badgeView.setX(self.frame.width - (self.badgeView?.frame.width)! - 12)
            self.badgeView.setY(0)
        }
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let imageX: CGFloat = 0;
        let imageY: CGFloat = 3;
        let imageW = self.bounds.width;
        let imageH = self.bounds.height * 0.6;
        
        return CGRectMake(imageX, imageY, imageW, imageH)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleX: CGFloat = 0
        let titleY: CGFloat = self.bounds.height * 0.6
        let titleW = self.bounds.width
        let titleH = self.bounds.height * 0.4
        
        return CGRectMake(titleX, titleY, titleW, titleH)
    }
}
