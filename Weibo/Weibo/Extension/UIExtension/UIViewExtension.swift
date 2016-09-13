//
//  UIViewExtension.swift
//  Weibo
//
//  Created by Lei Zhao on 9/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIView {
    
    func setX(x: CGFloat) {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func setY(y: CGFloat) {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func setWidth(width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func setHeight(height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
}
