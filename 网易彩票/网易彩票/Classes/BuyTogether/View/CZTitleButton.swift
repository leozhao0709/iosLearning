//
//  CZTitleButton.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/9/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZTitleButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    let ImageW: CGFloat = 30
    
    //去除按钮高亮状态
    override var highlighted: Bool {
        set {}
        get {
            return super.highlighted
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.imageView?.contentMode = UIViewContentMode.Center
        
//        self.imageView?.backgroundColor = UIColor.yellowColor()
    }
    
    //设置按钮标题位置
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let titleW = contentRect.width - ImageW
        let titleH = contentRect.height
        
        return CGRectMake(0, 0, titleW, titleH)
    }
    
    //设置按钮图片
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let imageW = ImageW
        let imageH = contentRect.height
        let imageX = contentRect.width - imageW
        
        return CGRectMake(imageX, 0, imageW, imageH)
    }

}
