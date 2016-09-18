//
//  UITabBarItemExtension.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UITabBarItem {
    
    func setImageWithOriginalImage(_ normalImage: UIImage?, selectedImage: UIImage?) {
        self.image = normalImage!.withRenderingMode(.alwaysOriginal)
        self.selectedImage = selectedImage!.withRenderingMode(.alwaysOriginal)
    }
    
    func setTitleTextColor(_ normalColor: UIColor?, selectedColor: UIColor?) {
        let nomalTitleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: normalColor!]
        self.setTitleTextAttributes(nomalTitleAttribute, for: UIControlState())
        
        let selectedTitleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: selectedColor!]
        self.setTitleTextAttributes(selectedTitleAttribute, for: UIControlState.selected)
    }
    
}
