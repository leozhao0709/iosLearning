//
//  WBNewfeatureViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBNewfeatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.cyan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(_ sender: UIButton) {
        let tabbarVC = WBTabBarController()
        
        let window = UIApplication.shared.keyWindow
        
        window?.rootViewController = tabbarVC
        
    }

}
