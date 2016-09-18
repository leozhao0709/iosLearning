//
//  WBBadgeView.swift
//  Weibo
//
//  Created by Lei Zhao on 9/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBBadgeView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var badge: UIImage?
    
    var badgeValue: String? {
        didSet {
            if let badgeValue = self.badgeValue {
                let badgeBackground = UIImage(named: "main_badge")
                self.badge = badgeBackground?.addTextInCenter(badgeValue, font: UIFont.systemFont(ofSize: 11), textColor: UIColor.white)
                self.image = self.badge
                self.sizeToFit()
            }
        }
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
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
     Just add UI, No frame need here
     */
    func setupUI() {
    }
    

}
