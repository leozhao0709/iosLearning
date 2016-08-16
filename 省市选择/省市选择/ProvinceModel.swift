//
//  ProvinceModel.swift
//  省市选择
//
//  Created by Lei Zhao on 7/26/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ProvinceModel: NSObject {

    var name: String!
    var cities: [String]!
    
    init(dict: [String: AnyObject]) {
        self.name = dict["name"] as! String
        self.cities = dict["cities"] as! [String]
    }
    
}
