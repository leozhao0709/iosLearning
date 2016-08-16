//
//  CZBuyTogetherViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/9/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZBuyTogetherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(btn: CZTitleButton) {
        UIView.animateWithDuration(0.25) {
            if CGAffineTransformIsIdentity((btn.imageView?.transform)!){
                btn.imageView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            } else{
                btn.imageView?.transform = CGAffineTransformIdentity
            }
            
        }
        
        
    }
}
