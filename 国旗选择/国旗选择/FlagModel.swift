//
//  FlagModel.swift
//  国旗选择
//
//  Created by Lei Zhao on 7/27/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class FlagModel: NSObject {
    var name: String!
    var icon: String!
    
    init(dict: [String: String]) {
        super.init()
        self.name = dict["name"]
        self.icon = dict["icon"]
    }
}
