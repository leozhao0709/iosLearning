//
//  ViewController.swift
//  手势识别2
//
//  Created by Lei Zhao on 8/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pinchTest()
        self.rotateTest()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     长按手势
     */
    private func longPressTest() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressView))
        
        longPress.minimumPressDuration = 2
        
        longPress.allowableMovement = 50
        
        self.blueView.addGestureRecognizer(longPress)
    }
    
    @objc private func longPressView() {
       NSLog("\(#function)")
    }
    
    /**
     清扫手势
     */
    private func swipeTest() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeView))
        
        swipe.direction = [.Down, .Up]
        
        self.blueView.addGestureRecognizer(swipe)
    }
    
    @objc private func swipeView() {
        NSLog("\(#function)")
    }
    
    /**
     *  旋转手势
     */
    private func rotateTest() {
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(self.rotateView(_:)))
        
        //如果想让多个手势起作用，必须实现代理
        rotation.delegate = self
        
        self.blueView.addGestureRecognizer(rotation)
    }
    
    @objc private func rotateView(recognizer: UIRotationGestureRecognizer) {
        
//        recognizer.view?.transform = CGAffineTransformMakeRotation(recognizer.rotation)
        
        recognizer.view?.transform = CGAffineTransformRotate((recognizer.view?.transform)!, recognizer.rotation)
        
        //recoginazer.rotation 会累加
        NSLog("\(#function)------- \(recognizer.rotation)")
        
        recognizer.rotation = 0
        
    }
    
    /**
     *  放大缩小手势(捏合手势)
     */
    
    private func pinchTest() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchView(_:)))
        
        //如果想让多个手势起作用，必须实现代理
        pinch.delegate = self
        
        self.blueView.addGestureRecognizer(pinch)
    }
    
    @objc private func pinchView(recogizer: UIPinchGestureRecognizer) {
        
        NSLog("\(#function)")
        
        //跟旋转一样，缩放比例会累加，所以要清1
        recogizer.view?.transform = CGAffineTransformScale((recogizer.view?.transform)!, recogizer.scale, recogizer.scale)
        
        recogizer.scale = 1
    }
    
    /**
     如果想实现多个手势同时执行，需要次代理
     
     - parameter gestureRecognizer:      <#gestureRecognizer description#>
     - parameter otherGestureRecognizer: <#otherGestureRecognizer description#>
     
     - returns: <#return value description#>
     */
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

