//
//  WBStatus.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation
import SwiftDate

class WBStatus: NSObject {
    var id: NSString?
    var text: NSString?
    
    var _create_at: NSString?
    var created_at: NSString? {
        get {
            
//            let formatter = DateFormatter()
//            formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
//            formatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
//            let createDate = formatter.date(from: _create_at as! String)
//            
//            let now = NSDate()
            
            let createDate = try! DateInRegion(string: _create_at as! String, format: .custom("EEE MMM dd HH:mm:ss Z yyyy"))
            
            let now = DateInRegion()
            
            if createDate.year == now.year {
                //This year
                if createDate.isToday {
                    if (now.hour - createDate.hour)>=1{
                        //其他小时
                        return String("\(now.hour-createDate.hour)分钟以前") as NSString?
                    } else if(now.minute - createDate.minute)>1 {
                        //within 1 hour
                        return String("\(now.minute-createDate.minute)分钟以前") as NSString?
                    } else {
                        return "刚刚"
                    }
                } else if createDate.isYesterday {
                    return createDate.string(custom: "昨天 HH时:mm分") as NSString?
                } else {
                    return createDate.string(custom: "MM月dd日 HH时:mm分") as NSString?
                }
                
            } else {
                return createDate.string(custom: "yy年MM月dd日 HH时:mm分") as NSString?
            }
            
            printLog(message: "\(createDate)")
            printLog(message: "\(now)")
            
            return _create_at
        }
        set {
            _create_at = newValue
        }
    }
    
    var source: NSString? {
        didSet{
            if (self.source != nil) && (self.source != ""){
                let startRange = self.source?.range(of: ">")
                let startIndex = (startRange?.location)! + 1
                let endRange = self.source?.range(of: "</")
                let length = (endRange?.location)! - startIndex
                self.source = self.source?.substring(with: NSMakeRange(startIndex, length)) as NSString?
            }
        }
    }
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
