//
//  CZView.swift
//  图片裁剪
//
//  Created by Lei Zhao on 7/30/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZView: UIView {


    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let ctx = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(arcCenter: CGPointMake(50, 50), radius: 50, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        
        CGContextAddPath(ctx, path.CGPath)
        
        CGContextClip(ctx)
        
        let image = UIImage(named: "me")
        
        image?.drawAtPoint(CGPointMake(0, 0))
        
    }


}
