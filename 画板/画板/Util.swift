//
//  Util.swift
//  画板
//
//  Created by Lei Zhao on 7/31/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIView {
    public func clipViewToImage() -> UIImage
    {
        UIGraphicsBeginImageContext(self.frame.size)
        
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
