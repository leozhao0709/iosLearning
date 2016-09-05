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
    func setImageButton(normalImage: UIImage, highlightImage: UIImage){
        //Note: It's setImage, not setBackgroundImage
        self.setImage(normalImage, forState: UIControlState.Normal)
        self.setImage(highlightImage, forState: UIControlState.Highlighted)
    }
    
}
