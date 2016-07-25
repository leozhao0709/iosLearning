//
//  AppModel.swift
//  collectionView应用管理
//
//  Created by Lei Zhao on 7/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class AppModel: NSObject {
    var icon: String!
    var name: String!
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.icon = dict["icon"] as! String
        self.name = dict["name"] as! String
    }
    
}
