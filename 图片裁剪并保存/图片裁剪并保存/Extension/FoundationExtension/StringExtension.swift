//
//  StringExtension.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension String {
    
    /// file system
    ///
    /// - returns: file path
    
    func appendFilePath(path: String)->String?{
        return (self as NSString).appendingPathComponent(path)
    }
    
}
