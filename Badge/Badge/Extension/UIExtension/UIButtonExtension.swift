//
//  UIButtonExtension.swift
//  音乐
//
//  Created by Lei Zhao on 9/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIButton {
    
    // MARK: - Button UI
    /**
     Set Image button. if you want to use image as a button, use this method
     
     - parameter normalImage:    normal state image
     - parameter highlightImage: highlight state image
     */
    func setImage(normalImage: UIImage?, highlightImage: UIImage?, selectedImage: UIImage? = nil){
        //Note: It's setImage, not setBackgroundImage
        self.setImage(normalImage, forState: UIControlState.Normal)
        self.setImage(highlightImage, forState: UIControlState.Highlighted)
        self.setImage(selectedImage, forState: .Selected)
    }
    
    func setBackgroundImage(normalImage: UIImage?, highlightImage: UIImage?, selectedImage: UIImage? = nil) {
        self.setBackgroundImage(normalImage, forState: .Normal)
        self.setBackgroundImage(highlightImage, forState: .Highlighted)
        self.setBackgroundImage(selectedImage, forState: .Selected)
    }
    
    func setTitleColor(normalColor: UIColor?, highlightColor: UIColor?, selectedColor: UIColor? = nil) {
        self.setTitleColor(normalColor, forState: .Normal)
        self.setTitleColor(highlightColor, forState: .Highlighted)
        self.setTitleColor(selectedColor, forState: .Selected)
    }
    
}
