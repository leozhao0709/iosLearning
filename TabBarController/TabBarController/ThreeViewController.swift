//
//  ThreeViewController.swift
//  TabBarController
//
//  Created by Lei Zhao on 7/30/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit {
        NSLog("老三close了")
    }

}
