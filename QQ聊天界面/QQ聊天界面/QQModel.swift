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

internal enum QQUserType : NSInteger{
    case Other = 0
    case Me
}

class QQModel: NSObject {
    
    //dataSource
    var text: String!
    var time: String!
    var type: QQUserType!
    
    //frame
    private(set) var timeLabelFrame: CGRect!
    private(set) var iconFrame: CGRect!
    private(set) var textFrame: CGRect!
    
    private(set) var height: CGFloat!
    
    //help
    var hideTimeLabel:Bool = false
    
    override init() {
        super.init()
    }
    
    init(text: String, time: String, type: QQUserType) {
        super.init()
        
        self.text = text
        self.time = time
        self.type = type
        
        self.setupFrame()
        
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.text = dict["text"] as? String
        self.time = dict["time"] as? String
        self.type = QQUserType(rawValue: dict["type"] as! NSInteger)
        
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
        
        if self.type == .Me {
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
        
        if self.type == .Me  {
            let rightTextX = kScreenSize.width - textSize.width - iconWidth - margin - margin - kDeltaMargin;
            self.textFrame = CGRectMake(rightTextX, textY, textSize.width + kDeltaMargin, textSize.height + kDeltaMargin)
        }
        else{
            self.textFrame = CGRectMake(textX, textY, textSize.width + kDeltaMargin, textSize.height + kDeltaMargin)
        }
        
        
        //增加button宽高
//        self.textFrame.size.width += kDeltaMargin
//        self.textFrame.size.height += kDeltaMargin
        
        //cell 高度
        
        self.height = CGRectGetMaxY(self.textFrame) + margin
        
    }

}

