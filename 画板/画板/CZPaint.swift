//
//  CZPaint.swift
//  画板
//
//  Created by Lei Zhao on 7/31/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZPaint: UIView {
    
//    //一条线上的点
//    var points: [CGPoint] = []
    
    //不同的线
    var paths: [UIBezierPath] = []
    
    override func drawRect(rect: CGRect) {
        
        // Drawing code
        
        UIColor.orangeColor().set()
        
        for path in self.paths {
            path.lineWidth = 5
            path.lineCapStyle = .Round
            path.stroke()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            
            let currentPoint = touch.locationInView(self)
            
            let path = UIBezierPath()
            
            path.moveToPoint(currentPoint)
            
            self.paths.append(path)
            
            self.setNeedsDisplay()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self)
            
            let currentPath = self.paths.last
            currentPath?.addLineToPoint(currentPoint)
            
            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    func back() {
        if !self.paths.isEmpty {
            self.paths.removeLast()
            self.setNeedsDisplay()
        }
    }

    func clear() {
        self.paths.removeAll()
        self.setNeedsDisplay()
    }

    //相当于截屏
    func save() {
        
    }
}
