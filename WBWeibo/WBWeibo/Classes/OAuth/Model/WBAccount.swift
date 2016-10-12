//
//  WBAccount.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/11/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

let WBAccountFileName = "account.data"

class WBAccount:NSObject, NSCoding {
    
    var access_token: NSString?
    var expires_in: NSNumber?
    var remind_in: NSNumber?
    var expires_time: NSDate?
    var uid: NSNumber?
    var profile_image_url: NSString?
    
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.access_token = aDecoder.decodeObject(forKey: "access_token") as! NSString?
        self.expires_in = aDecoder.decodeObject(forKey: "expires_in") as! NSNumber?
        self.remind_in = aDecoder.decodeObject(forKey: "remind_in") as! NSNumber?
        self.uid = aDecoder.decodeObject(forKey: "uid") as! NSNumber?
        self.expires_time = aDecoder.decodeObject(forKey: "expires_time") as! NSDate?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.access_token, forKey: "access_token")
        aCoder.encode(self.expires_in, forKey: "expires_in")
        aCoder.encode(self.remind_in, forKey: "remind_in")
        aCoder.encode(self.uid, forKey: "uid")
        aCoder.encode(self.expires_time, forKey: "expires_time")
    }
    
    func save()->Bool {
        let accountPath = WBAccountFileName.addToCacheDir()
        printLog("\(accountPath)")
        self.expires_time = NSDate(timeIntervalSinceNow: self.expires_in as! TimeInterval)
        
        return NSKeyedArchiver.archiveRootObject(self, toFile: accountPath!)
    }
    
    static func accountFromSandbox()->WBAccount? {
        let accountPath = WBAccountFileName.addToCacheDir()
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath!) as! WBAccount
        
        let now = NSDate()
        if now.compare(account.expires_time as! Date) == .orderedDescending  {
            return nil
        }
        
        return account
    }
    
}
