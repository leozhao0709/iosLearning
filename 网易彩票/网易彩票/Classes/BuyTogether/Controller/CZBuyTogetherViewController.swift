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

    @IBAction func btnClick(_ btn: CZTitleButton) {
        UIView.animate(withDuration: 0.25, animations: {
            if (btn.imageView?.transform)!.isIdentity{
                btn.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            } else{
                btn.imageView?.transform = CGAffineTransform.identity
            }
            
        }) 
        
        
    }
}
