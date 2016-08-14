//
//  CZProduct.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZProduct: NSObject {
    
    var icon: String!
    var title: String!
    var identifier: String!
    var schemes: String!
    var appUrl: String!
    
    init(dict: [String: String]) {
        super.init()
        self.icon = dict["icon"]
        self.title = dict["title"]
        self.identifier = dict["id"]
        self.schemes = dict["customUrl"]
        self.appUrl = dict["url"]
    }

}
