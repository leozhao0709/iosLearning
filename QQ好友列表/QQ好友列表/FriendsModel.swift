//
//  FriendsModel.swift
//  QQ好友列表
//
//  Created by Lei Zhao on 7/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class FriendsModel: NSObject {
    
    var icon: String!
    var intro: String!
    var name: String!
    var vip: Int!
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.icon = dict["icon"] as! String
        self.intro = dict["intro"] as! String
        self.name = dict["name"] as! String
        self.vip = dict["vip"] as! Int
    }
    
}
