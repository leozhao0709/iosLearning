//
//  WeiboModel.swift
//  简单微博
//
//  Created by Lei Zhao on 7/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WeiboModel: NSObject {
    
    var text: String!
    var icon: String!
    var picture: String?
    var name: String!
    var vip: NSNumber!
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
    }
    
}
