//
//  WBAccount.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/11/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

let WBAccountFileName = "account.data"

class WBAccount:NSObject {
    
    var access_token: NSString?
    var expires_in: NSNumber?
    var remind_in: NSNumber?
    var expires_time: NSDate?
    var uid: NSNumber?
    var profile_image_url: NSString?
    
    func save()->Bool {
        let accountPath = WBAccountFileName.addToCacheDir()
        printLog("\(accountPath)")
        self.expires_time = NSDate(timeIntervalSinceNow: self.expires_in as! TimeInterval)
        
        return NSKeyedArchiver.archiveRootObject(self, toFile: accountPath!)
    }
    
    static func accountFromSandbox()->WBAccount? {
        let accountPath = WBAccountFileName.addToDocumentDir()
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath!) as! WBAccount
        
        let now = NSDate()
        if now.compare(account.expires_time as! Date) == .orderedDescending  {
            return nil
        }
        
        return account
    }
    
}
