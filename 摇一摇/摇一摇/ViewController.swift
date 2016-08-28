//
//  ViewController.swift
//  摇一摇
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        NSLog("摇了摇")
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        NSLog("\(#function)")
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        NSLog("\(#function)")
    }

}

