//
//  ViewController.swift
//  手势识别
//
//  Created by Lei Zhao on 8/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        
//        //双击
//        tap.numberOfTapsRequired = 2
//        
//        //需要两根手指
//        tap.numberOfTouchesRequired = 2
        
        self.imageView.addGestureRecognizer(tap)
        
        self.imageView.userInteractionEnabled = true
        self.imageView.multipleTouchEnabled = true
        
        tap.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func tapView(){
        NSLog("\(#function)")
    }
    
    // MARK: - 手势识别
    /**
     当view被触摸后，会先调用这个方法,问代理，当前手指所在的位置是否要做出反应
     
     - parameter gestureRecognizer: <#gestureRecognizer description#>
     - parameter touch:             <#touch description#>
     
     - returns: <#return value description#>
     */
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        
        let point = touch.locationInView(touch.view)
        
        if point.x <= self.imageView.frame.width/2 {
            return true
        }
        
        return false
    }


}

