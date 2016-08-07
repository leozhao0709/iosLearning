//
//  ViewController.swift
//  图片抖动
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

    @IBAction func start(sender: UIButton) {
        
        //抖动图片 使用帧动画 设置旋转路径
        
        let rotationAni = CAKeyframeAnimation(keyPath: "transform.rotation")
//        rotationAni.keyPath = "transform.rotation"
        
        let angle: CGFloat = CGFloat(M_PI_4) * 0.3
        
        rotationAni.values = [-angle, angle, -angle]
        
        rotationAni.repeatCount = MAXFLOAT
        
        self.imageView.layer.addAnimation(rotationAni, forKey: "shake")
    }

    @IBAction func stop(sender: UIButton) {
        self.imageView.layer.removeAnimationForKey("shake")
    }
}

