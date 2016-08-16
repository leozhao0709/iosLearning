//
//  HeroModel.swift
//  英雄展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class HeroModel: NSObject {
    var icon: String?
    var intro: String?
    var name: String?
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String: AnyObject])
    }
    
    init(name: String) {
        super.init()
        
        self.name = name
    }
}
