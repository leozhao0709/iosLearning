//
//  WBNavigationController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/21/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let item = UIBarButtonItem.appearance()
        
        let nomalTitleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.orange]
        item.setTitleTextAttributes(nomalTitleAttribute, for: UIControlState.normal)

        let hightlightedTitleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.green]
        item.setTitleTextAttributes(hightlightedTitleAttribute, for: UIControlState.highlighted)
    }


}
