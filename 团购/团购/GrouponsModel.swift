//
//  GrouponsModel.swift
//  团购
//
//  Created by Lei Zhao on 7/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class GrouponsModel: NSObject {
    var icon: String?
    var buyCount: String?
    var price: String?
    var title: String?
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
    }
}
