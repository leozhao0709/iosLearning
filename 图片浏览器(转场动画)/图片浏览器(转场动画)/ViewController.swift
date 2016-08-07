//
//  ViewController.swift
//  图片浏览器(转场动画)
//
//  Created by Lei Zhao on 8/6/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imgs:[UIImage]? = {
        
        var tempArray: [UIImage] = []
        
        for i in 1..<10 {
            let imageName = String(format: "%d.jpg", i)
            tempArray.append(UIImage(named: imageName)!)
        }
        
        return tempArray
    }()
    
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapView(tap: UITapGestureRecognizer) {
        
        let point = tap.locationInView(tap.view)
        
        if point.x <= (tap.view?.bounds.width)!*0.5 {
            NSLog("(上一张)")
            
            self.previousPict()
        }
        else {
            NSLog("下一张")
            self.nextPict()
        }
        
    }
    
    private func previousPict() {
        if self.currentIndex == 0 {
            return
        }
        
        self.currentIndex -= 1
        
        self.imageView.image = self.imgs![self.currentIndex]
        
        self.transitAni("cube")
    }
    
    private func nextPict() {
        if self.currentIndex == (self.imgs?.count)! - 1{
            return
        }
        
        self.currentIndex += 1
        
        self.imageView.image = self.imgs![self.currentIndex]
        
        self.transitAni("rippleEffect", subtype: "fromRight")
    }
    
    /**
     *******************************************************
     type:动画类型(比如：滴水效果，翻转效果...)
     -------------------------------------------------------
     fade kCATransitionFade 交叉淡化过渡
     moveIn kCATransitionMoveIn 新视图移到旧视图上面
     push kCATransitionPush 新视图把旧视图推出去
     reveal kCATransitionReveal 将旧视图移开,显示下面的新视图
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect             滴水效果
     suckEffect 收缩效果，如一块布被抽走
     cube                   立方体效果
     oglFlip              上下左右翻转效果
     rotate     旋转效果
     cameraIrisHollowClose 相机镜头关上效果(不支持过渡方向)
     cameraIrisHollowOpen 相机镜头打开效果(不支持过渡方向)
     
     *******************************************************
     subtype: 动画方向(比如说是从左边进入，还是从右边进入...)
     ------------------------------------------------------
     kCATransitionFromRight;
     kCATransitionFromLeft;
     kCATransitionFromTop;
     kCATransitionFromBottom;
     
     当 type 为@"rotate"(旋转)的时候,它也有几个对应的 subtype,分别为:
     90cw 逆时针旋转 90°
     90ccw 顺时针旋转 90°
     180cw 逆时针旋转 180°
     180ccw  顺时针旋转 180°
     **/
    
    private func transitAni(type: String, subtype: String = "fromLeft") {
        
        /* The name of the transition. Current legal transition types include
         * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
        
        let animation = CATransition()
        animation.type = type
        
        /* An optional subtype for the transition. E.g. used to specify the
         * transition direction for motion-based transitions, in which case
         * the legal values are `fromLeft', `fromRight', `fromTop' and
         * `fromBottom'. */
        animation.subtype = subtype
        
        animation.duration = 2
        
        self.imageView.layer.addAnimation(animation, forKey: nil)
    }

}

