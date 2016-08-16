//
//  InnerCarModel.swift
//  不同的汽车展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class InnerCarModel: NSObject {
    
    var icon: String?
    var name: String?
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String: AnyObject])
    }
}
