//
//  CZSettingItem.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/10/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZSettingItem: NSObject {
    
    var icon: String?
    var title: String!
    
    var vcClass: AnyClass?
    
    var operation: (()->Void)?
    
    init(icon: String?, title: String) {
        self.icon = icon
        self.title = title
    }
    
    init(icon: String?, title: String, vcClass: AnyClass) {
        self.icon = icon
        self.title = title
        self.vcClass = vcClass
    }
}
