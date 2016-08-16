//
//  CZLockView.swift
//  手势解锁
//
//  Created by Lei Zhao on 7/31/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZLockView: UIView {
    
    var selectedBtns:[UIButton] = []
    
    var currentPoint: CGPoint?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    private func setup() {
        
        for _ in 0..<9 {
            
            let btn = UIButton(type: UIButtonType.Custom)
            
            btn.userInteractionEnabled = false
            
            btn.setBackgroundImage(UIImage(named: "gesture_node_normal"), forState: UIControlState.Normal)
            
            btn.setBackgroundImage(UIImage(named: "gesture_node_highlighted"), forState: UIControlState.Selected)
            
            self.addSubview(btn)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for i in 0..<self.subviews.count {
            
            let btn = self.subviews[i]
            
            let totalColumn = 3
            
            let btnW:CGFloat = 74
            let btnH:CGFloat = 74
            
            let col:CGFloat = CGFloat(i % totalColumn)
            let row:CGFloat = CGFloat(i / totalColumn)
            
            let marginX:CGFloat = (self.frame.width - CGFloat(totalColumn) * btnW) / (CGFloat(totalColumn) + 1)
            let marginY = marginX
            
            let x = marginX  + col * (btnW + marginX)
            let y = row * (btnH + marginY)
            
            btn.frame = CGRectMake(x, y, btnW, btnH)
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = touches.first {
//            let point = touch.locationInView(touch.view)
//            
//            for btn in self.subviews{
//                if CGRectContainsPoint(btn.frame, point) {
//                    let button = btn as! UIButton
//                    button.selected = true
//                }
//                
//            }
//        }
        
        let point = self.touchesPoint(touches)
        
        if let btn = self.buttonWithPoint(point) where !btn.selected{
            btn.selected = true
            
            self.selectedBtns.append(btn)
            
            self.setNeedsDisplay()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = touches.first {
//            let point = touch.locationInView(touch.view)
//            
//            for btn in self.subviews{
//                if CGRectContainsPoint(btn.frame, point) {
//                    let button = btn as! UIButton
//                    button.selected = true
//                }
//                
//            }
//        }
        
        let point = self.touchesPoint(touches)
        
        if let btn = self.buttonWithPoint(point) where !btn.selected{
            btn.selected = true
            
            self.selectedBtns.append(btn)
        }
        else {
            self.currentPoint = point
        }
        
        self.setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for btn in self.selectedBtns {
            btn.selected = false
        }
        
        self.selectedBtns.removeAll()
        
        self.currentPoint = nil
        
        self.setNeedsDisplay()
    }
    
    func touchesPoint(touches: Set<UITouch>) -> CGPoint {
        let touch = touches.first
        return (touch?.locationInView(touch?.view))!
    }
    
    func buttonWithPoint(point: CGPoint)->UIButton? {
        for btn in self.subviews{
            if CGRectContainsPoint(btn.frame, point) {
                let button = btn as! UIButton
                return button
            }
        }
        
        return nil
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 0 ..< self.selectedBtns.count {
            let btn = self.selectedBtns[i]
            
            if i == 0 {
                path.moveToPoint(btn.center)
            }
            
            path.addLineToPoint(btn.center)
        }
        
        if let point = self.currentPoint {
            path.addLineToPoint(point)
        }
        
        
        UIColor(red: 32/255.0, green: 210/255.0, blue: 254/255.0, alpha: 0.7).set()
        
        path.lineWidth = 10
        
        path.lineJoinStyle = .Round
        
        path.stroke()
        
    }
}
