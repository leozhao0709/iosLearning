//
//  ViewController.swift
//  核心动画
//
//  Created by Lei Zhao on 8/6/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //多个动画可以使用group
        let group = CAAnimationGroup()
        
        //平移
        let positionAni = CABasicAnimation(keyPath: "position")
        positionAni.toValue = NSValue(CGPoint: CGPointMake(250, 250))
        
        //旋转
        let rotationAni = CABasicAnimation(keyPath: "transform.rotation")
        rotationAni.toValue = M_PI_2
        
        //绽放效果
        let scaleAni = CABasicAnimation(keyPath: "transform.scale")
        scaleAni.toValue = 0.5
        
        group.duration = 3
        group.animations = [positionAni, rotationAni, scaleAni]
        
        self.imageView.layer.addAnimation(group, forKey: nil)
    }

}

