//
//  Utils.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

/**
 just want code autoCompletion
 
 - parameter format: Log String
 */
func printLog(message: String, fileName: String = #file, lineNumber: Int = #line, columnNumber: Int = #column) {
    #if DEBUG
        
        NSLog("\((fileName as NSString).lastPathComponent)[\(lineNumber):\(columnNumber)]: \(message)")
    #endif
}
