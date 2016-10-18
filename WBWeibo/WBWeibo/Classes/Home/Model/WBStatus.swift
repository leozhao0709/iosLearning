//
//  WBStatus.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

class WBStatus: NSObject {
    var id: NSString?
    var text: NSString?
    var created_at: NSString?
    var source: NSString?
    var reposts_count: NSNumber?
    var comments_count: NSNumber?
    var attitudes_count: NSNumber?
    var user: WBUser?
    var retweeted_status: WBStatus?
    var pic_urls: NSArray?
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["pic_urls":WBPhoto.self]
    }
    
    
}
