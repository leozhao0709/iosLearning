//
//  WBTitleButton.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBTitleButton: UIButton {

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
        self.setTitleColor(UIColor.black, for: .normal)
        self.sizeToFit()
        self.imageView?.contentMode = .center
        self.titleLabel?.contentMode = .center
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()

        self.titleLabel?.x = 0
        self.imageView?.x = (self.titleLabel?.frame.maxX)! + 5
    }
    

}
