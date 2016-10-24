//
//  UIButtonExtension.swift
//  音乐
//
//  Created by Lei Zhao on 9/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIButton {
    
    public convenience init(normalImage: UIImage?, highlightImage: UIImage?, selectedImage: UIImage? = nil) {
        self.init(type: UIButtonType.custom)
        self.setImage(normalImage, highlightImage: highlightImage, selectedImage: selectedImage)
    }
    
    // MARK: - Button UI
    /**
     Set Image button. if you want to use image as a button, use this method
     
     - parameter normalImage:    normal state image
     - parameter highlightImage: highlight state image
     */
    func setImage(_ normalImage: UIImage?, highlightImage: UIImage?, selectedImage: UIImage? = nil){
        //Note: It's setImage, not setBackgroundImage
        self.setImage(normalImage, for: UIControlState())
        self.setImage(highlightImage, for: UIControlState.highlighted)
        self.setImage(selectedImage, for: .selected)
    }
    
    func setBackgroundImage(_ normalImage: UIImage?, highlightImage: UIImage?, selectedImage: UIImage? = nil) {
        self.setBackgroundImage(normalImage, for: UIControlState())
        self.setBackgroundImage(highlightImage, for: .highlighted)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    
    func setTitleColor(_ normalColor: UIColor?, highlightColor: UIColor?, selectedColor: UIColor? = nil, disabledColor: UIColor? = nil) {
        self.setTitleColor(normalColor, for: UIControlState())
        self.setTitleColor(highlightColor, for: .highlighted)
        self.setTitleColor(selectedColor, for: .selected)
        self.setTitleColor(disabledColor, for: .disabled)
    }
    
}
