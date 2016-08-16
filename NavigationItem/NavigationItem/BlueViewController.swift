//
//  BlueViewController.swift
//  NavigationItem
//
//  Created by Lei Zhao on 7/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToYellow(sender: UIButton) {
        
        let yellowVC = YellowViewController()
        
        self.navigationController?.showViewController(yellowVC, sender: self)
    }
    
    @IBAction func backToRed(sender: UIButton) {
        let redVC = RedViewController()
        
        self.navigationController?.showViewController(redVC, sender: self)
    }
    
    deinit {
        NSLog("BlueView was destruct ")
    }

}
