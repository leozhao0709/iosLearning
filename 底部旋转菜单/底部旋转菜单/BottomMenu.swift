//
//  BottomMenu.swift
//  底部旋转菜单
//
//  Created by Lei Zhao on 8/7/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

let AnimationDuration: NSTimeInterval = 2

let delta: CGFloat = 90 //按钮间距

class BottomMenu: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private var items:[UIButton] = []
    
    @IBOutlet weak var mainBtn: UIButton!
    
    internal static func bottomMenu()->BottomMenu {
        let menu = NSBundle.mainBundle().loadNibNamed("BottomMenu", owner: nil, options: nil).last! as! BottomMenu
        
        return menu
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initItems()
    }
    
    private func initItems() {
        
        self.addBtnWithBgImage("menu_btn_call", tag: 0)
        self.addBtnWithBgImage("menu_btn_cheyou", tag: 1)
        self.addBtnWithBgImage("menu_btn_tixing", tag: 2)
        
        
    }
    
    /**
     ＊  通过图片来添加按钮
     */
    private func addBtnWithBgImage(bgImage: String, tag: Int) {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: bgImage), forState: UIControlState.Normal)
        btn.tag = tag
        self.items.append(btn)
        self.addSubview(btn)
    }
    
    //MARK: - 设置三个隐藏按钮的尺寸和位置
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnBounds = CGRectMake(0, 0, 43, 43)
        for btn in self.items {
            btn.bounds = btnBounds
            btn.center = self.mainBtn.center
        }
        
        self.bringSubviewToFront(self.mainBtn)
    }

    @IBAction func mainBtnClick(sender: UIButton) {
        
        let show: Bool = CGAffineTransformIsIdentity(self.mainBtn.transform)
        
        //主按钮动画 (没有过程，可以使用最原始的)
        UIView.animateWithDuration(AnimationDuration) {
            
            //查看transform是否被改变
            if (show) //未被改变
            {
                self.mainBtn.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            }
            else {
                self.mainBtn.transform = CGAffineTransformIdentity
            }
        }
        
        //item 动画需要好几个过程，所以需要帧动画
        self.showItems(show)
    }
    
    private func showItems(show: Bool) {
        for btn in self.items {
            
            let group = CAAnimationGroup()
            group.duration = AnimationDuration
            
            //平移动画
            let positionAni = CAKeyframeAnimation(keyPath: "position")
            group.removedOnCompletion = false
            group.fillMode = kCAFillModeForwards
            
            let showPositionX = self.mainBtn.center.x + CGFloat(btn.tag + 1) * delta
            let showPositionY = self.mainBtn.center.y
            
            let showPosition = CGPointMake(showPositionX, showPositionY)
            let value1 = NSValue(CGPoint: self.mainBtn.center)
            let value2 = NSValue(CGPoint: CGPointMake(showPositionX * 0.5, showPositionY))
            let value3 = NSValue(CGPoint: CGPointMake(showPositionX * 1.1, showPositionY))
            let value4 = NSValue(CGPoint: showPosition)
            
            let rotationAni = CAKeyframeAnimation(keyPath: "transform.rotation")
            
            if show {
                
                positionAni.values = [value1, value2, value3, value4]
                
                rotationAni.values = [0, M_PI * 2, M_PI * 4, M_PI * 2]
            } else {
            
                positionAni.values = [value4, value3, value2, value1]
                
                rotationAni.values = [0, M_PI * 2, 0, -M_PI * 2]
            }
            
            group.animations=[positionAni, rotationAni]
            
            btn.layer.addAnimation(group, forKey: nil)
        }
    }
    
}
