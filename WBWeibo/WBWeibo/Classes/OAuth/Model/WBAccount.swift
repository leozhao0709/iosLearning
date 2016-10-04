//
//  WBAccount.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON
import Realm

class WBAccount: Object {
    
    dynamic var uid: Int = 0
    dynamic var access_token: String?
    var expires_in = 0
    var remind_in = 0
    dynamic var expires_time: NSDate?
    dynamic var profile_image_url: String?
    
    override static func primaryKey() -> String? {
        return "uid"
    }
    
    convenience init(json: JSON) {
        self.init()
        self.access_token = json["access_token"].stringValue
        self.expires_in = json["expires_in"].intValue
        self.remind_in = json["remind_in"].intValue
        self.uid = json["uid"].intValue
        self.expires_time = NSDate(timeIntervalSinceNow: TimeInterval(self.expires_in))
    }
    
    func save() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self, update: true)
        }
    }
    
}
