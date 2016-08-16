//
//  Util.swift
//  QQ聊天界面
//
//  Created by Lei Zhao on 7/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension String {
    
    /**
     get a fit size when the string as text
     
     - parameter width:    label width
     - parameter fontSize: label font size
     
     - returns: return the real size of this string as a text
     */
    func asTextSize(textMaxWidth width: CGFloat, textFontSize fontSize: CGFloat) -> CGSize {
        let textRealSize = (self as NSString).boundingRectWithSize(CGSizeMake(width, 0), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)], context: nil).size
        
        return textRealSize
    }
}