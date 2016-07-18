//
//  CarModel.swift
//  汽车展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

class CarModel: NSObject {
    
    var title: String?
    var desc: String?
    var cars: NSArray?
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
    }
    
}
