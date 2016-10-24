//
//  File.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func getDocumentDir()->String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    }
    
    static func getCacheDir()->String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    }
    
    static func getTempDir()->String {
        return NSTemporaryDirectory()
    }
    
    
}
