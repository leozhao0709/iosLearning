//
//  ViewController.swift
//  车小弟模仿
//
//  Created by Lei Zhao on 8/6/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import OBShapedButton

class ViewController: UIViewController {

    @IBOutlet weak var circleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0..<3 {
            let imageName = String(format: "circle%d", i+1)
            
            let btn = OBShapedButton(type: UIButtonType.Custom)
            
            btn.frame = self.circleImageView.bounds
            btn.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
            btn.tag = i
            
            btn.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.circleImageView.addSubview(btn)
        }
        
        let centerBtn = UIButton(type: UIButtonType.Custom)
        
        centerBtn.frame = CGRectMake(0, 0, 112, 112)
        centerBtn.center = self.circleImageView.center
        centerBtn.setBackgroundImage(UIImage(named: "home_btn_dealer_had_bind"), forState: UIControlState.Normal)
        self.view.addSubview(centerBtn)
        
        centerBtn.addTarget(self, action: #selector(self.centerBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func centerBtnClick(btn: UIButton){
        
        let currentAlpha = self.circleImageView.alpha
        
        //先实现隐藏和显示
        
        if currentAlpha == 0 {
            self.circleImageView.alpha = 1
        } else {
            self.circleImageView.alpha = 0
        }
        
        //添加动画
        //创建组动画
        let group = CAAnimationGroup()
        
        //添加透明度动画
        let opacityAni = CABasicAnimation(keyPath: "opacity")
        
        //缩放(先放大再缩小，所以使用CAKeyframeAnimation)
        let scaleAni = CAKeyframeAnimation(keyPath: "transform.scale")
        
        //旋转
//        let rotationAni = CABasicAnimation(keyPath: "transform.rotation")
        
        let rotationAnotherAni = CAKeyframeAnimation(keyPath: "transform.rotation")
        
        if currentAlpha == 1 {
            opacityAni.fromValue = 1
            opacityAni.toValue = 0
            
            scaleAni.values = [1, 1.2, 0]
            
//            rotationAni.fromValue = 0
//            rotationAni.toValue = -M_PI_4
            
            rotationAnotherAni.values = [0, -M_PI_4]
        }
        else {
            opacityAni.fromValue = 0
            opacityAni.toValue = 1
            
            scaleAni.values = [0, 1.2, 1]
            
//            rotationAni.fromValue = -M_PI_4
//            rotationAni.toValue = 0
            
            rotationAnotherAni.values = [-M_PI_4, 0]
        }
        
        group.animations = [opacityAni, scaleAni, rotationAnotherAni]
        group.duration = 2
        
        self.circleImageView.layer.addAnimation(group, forKey: nil)
    }
    
    @objc private func btnClick(btn: UIButton) {
        
    }


}

