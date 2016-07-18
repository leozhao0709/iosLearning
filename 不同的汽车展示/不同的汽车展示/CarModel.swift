//
//  CarModel.swift
//  不同的汽车展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CarModel: NSObject {
    
    var title: String?
    var cars: NSArray?
    
    init(dict: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
        
        var innerCarsArray:[InnerCarModel] = []
        for dict in cars! {
            let innerCar = InnerCarModel(dict: dict as! NSDictionary)
            innerCarsArray.append(innerCar)
        }
        
        self.cars = innerCarsArray
        
    }

}
