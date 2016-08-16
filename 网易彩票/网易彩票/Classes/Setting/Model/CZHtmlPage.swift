//
//  CZHtmlPage.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZHtmlPage: NSObject {
    var title: String!
    var html: String!
    var ID: String!
    
    init(dict: [String: String]) {
        super.init()
        self.title = dict["title"]
        self.html = dict["html"]
        self.ID = dict["id"]
    }
}
