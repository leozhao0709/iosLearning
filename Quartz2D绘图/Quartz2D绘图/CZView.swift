//
//  CZView.swift
//  Quartz2D绘图
//
//  Created by Lei Zhao on 7/30/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        
        
    }
    
    //圆角矩形 or 圆
    private func test05() {
        let path = UIBezierPath(roundedRect: CGRectMake(50, 50, 200, 200), cornerRadius: 100)
        
        path.stroke()
    }
    
    //矩形
    private func test04() {
        let path = UIBezierPath(rect: CGRectMake(100, 100, 100, 100))
        
        path.stroke()
    }
    
    //线段
    private func test01() {
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(ctx, 50, 50)
        CGContextAddLineToPoint(ctx, 150, 150)
        CGContextAddLineToPoint(ctx, 50, 150)
        //        CGContextAddLineToPoint(ctx, 50, 50)
        CGContextClosePath(ctx)
        
        //重新设置起点
        CGContextMoveToPoint(ctx, 50, 200)
        CGContextAddLineToPoint(ctx, 200, 200)
        
        CGContextStrokePath(ctx)
    }
    
    //矩形
    private func test02() {
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextAddRect(ctx, CGRectMake(50, 50, 150, 150))
        
        //        CGContextStrokePath(ctx)
        
        CGContextFillPath(ctx)
    }
    
    //矩形
    private func test03() {
        let ctx = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(rect: CGRectMake(50, 50, 100, 100))
        
        CGContextAddPath(ctx, path.CGPath)
        
        CGContextDrawPath(ctx, CGPathDrawingMode.Stroke)
    }
 

}
