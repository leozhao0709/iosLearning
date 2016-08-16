//
//  YellowViewController.swift
//  NavigationItem
//
//  Created by Lei Zhao on 7/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToRedView(sender: UIButton) {
        
        let redVC = RedViewController()
        
        self.navigationController?.showViewController(redVC, sender: self)
    }
    
    @IBAction func jumpToBlue(sender: UIButton) {
        
        let blueVC = BlueViewController()
        
        self.navigationController?.showViewController(blueVC, sender: self)
    }
    
    deinit {
        NSLog("YellowView was destruct ")
    }

}
