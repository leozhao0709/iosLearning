//
//  UITabBarItemExtension.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UITabBarItem {
    
    func setImageWithOriginalImage(normalImage: UIImage, selectedImage: UIImage) {
        self.image = normalImage.imageWithRenderingMode(.AlwaysOriginal)
        self.selectedImage = selectedImage.imageWithRenderingMode(.AlwaysOriginal)
    }
    
}