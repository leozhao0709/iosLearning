//
//  QQModel.swift
//  QQ聊天界面
//
//  Created by Lei Zhao on 7/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

let kScreenSize = UIScreen.mainScreen().bounds.size
let kDeltaMargin: CGFloat = 40

class QQModel: NSObject {
    
    //dataSource
    var text: String!
    var time: String!
    var type: NSInteger!
    
    //frame
    private(set) var timeLabelFrame: CGRect!
    private(set) var iconFrame: CGRect!
    private(set) var textFrame: CGRect!
    
    private(set) var height: CGFloat!
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.text = dict["text"] as? String
        self.time = dict["time"] as? String
        self.type = dict["type"] as? NSInteger
        
        self.setupFrame()
    }
    
    private func setupFrame() {
        
        //time label frame
        self.timeLabelFrame = CGRectMake(0, 0, kScreenSize.width, 20)
        
        //user picture frame
        let margin: CGFloat = 10
        let iconX:CGFloat = margin
        let iconY = CGRectGetMaxY(self.timeLabelFrame) + margin
        let iconWidth: CGFloat = 40
        
        if self.type == 1 {
            let rightIconX = kScreenSize.width - margin - iconWidth
            self.iconFrame = CGRectMake(rightIconX, iconY, iconWidth, iconWidth)
        }
        else
        {
          self.iconFrame = CGRectMake(iconX, iconY, iconWidth, iconWidth)
        }
        
        
        //text frame
        let textX = CGRectGetMaxX(self.iconFrame) + margin
        let textY = iconY
        let textMaxWidth = kScreenSize.width - 2 * iconWidth - 4 * margin
        
        let textSize = self.text.asTextSize(textMaxWidth: textMaxWidth, textFontSize: 17)
        
        if self.type == 1 {
            let rightTextX = kScreenSize.width - textSize.width - iconWidth - margin - margin;
            self.textFrame = CGRectMake(rightTextX, textY, textSize.width, textSize.height)
        }
        else{
            self.textFrame = CGRectMake(textX, textY, textSize.width, textSize.height)
        }
        
        
        //增加button宽高
//        self.textFrame.size.width += kDeltaMargin
//        self.textFrame.size.height += kDeltaMargin
        
        //cell 高度
        
        self.height = CGRectGetMaxY(self.textFrame) + margin
        
    }

}

