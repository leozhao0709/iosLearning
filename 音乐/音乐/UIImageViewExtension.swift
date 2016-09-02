//
//  UIImageViewExtension.swift
//  音乐
//
//  Created by Lei Zhao on 9/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /**
     Fade a new Image in ImageView
     */
    func fadeImageIn(image: UIImage?, closure: ((image: UIImage?) -> ())? = nil) {
        if let image = image {
            self.image = image
            
            //fade in
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionFade
            self.layer.addAnimation(transition, forKey: nil)
            
            closure?(image:image)
            
        } else {
            return
        }
    }
    
}
