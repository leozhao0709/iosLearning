//
//  CZView.swift
//  饼状图
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
        
        let data = [30, 15, 5, 17, 3, 10, 20]
        
        let center = CGPointMake(rect.size.width/2, rect.size.height/2)
        
        let radius = min(rect.size.width, rect.size.height)/2
        
        var start: CGFloat = 0;
        var end: CGFloat = 0;
        
        for i in 0..<data.count {
            
            end = (CGFloat(data[i])/100) * 2 * CGFloat(M_PI) + start
            
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: start, endAngle: end, clockwise: true)
            
            path.addLineToPoint(center)
            
            self.randomColor().setFill()
            
            path.fill()
//            path.stroke()
            
            start = end
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.setNeedsDisplay()
    }
    
    private func randomColor()->UIColor {
        let red:CGFloat = CGFloat(arc4random_uniform(256))/255
        let green:CGFloat = CGFloat(arc4random_uniform(256))/255
        let blue:CGFloat = CGFloat(arc4random_uniform(256))/255
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        NSLog("red: \(red), green: \(green), blue: \(blue)")
        
        return color
    }
 

}
