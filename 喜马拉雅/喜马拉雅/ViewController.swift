//
//  ViewController.swift
//  喜马拉雅
//
//  Created by Lei Zhao on 7/16/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lastImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lastImageViewY = CGRectGetMaxY(lastImageView.frame)
        
        scrollView.contentSize = CGSizeMake(0, lastImageViewY)
        
        scrollView.contentOffset = CGPointMake(0, -64)
        
        scrollView.contentInset = UIEdgeInsetsMake(64, 0, 44, 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

