//
//  GroupsModel.swift
//  QQ好友列表
//
//  Created by Lei Zhao on 7/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class GroupsModel: NSObject {
    var name: String!
    var online: Int!
    var friends: [FriendsModel]!
    
    var isFolding: Bool = true
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.name = dict["name"] as! String
        self.online = dict["online"] as! Int
        let friends = dict["friends"] as! [[String: AnyObject]]
        
        var friendsModelArray: [FriendsModel] = []
        for friend in friends {
            let friendModel = FriendsModel(dict: friend)
            
            friendsModelArray.append(friendModel)
        }
        self.friends = friendsModelArray
    }
    
}
