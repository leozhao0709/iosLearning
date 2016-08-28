//
//  ViewController.swift
//  距离传感器
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //距离传感器默认关闭
        UIDevice.currentDevice().proximityMonitoringEnabled = true
        
        //通过通知（一旦有物品靠近或者离开，都会发出通知）
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.proximityStateDidChange), name: UIDeviceProximityStateDidChangeNotification, object: nil)
    }
    
    @objc private func proximityStateDidChange() {
        
        if UIDevice.currentDevice().proximityState {
            NSLog("有物品靠近")
        } else {
            NSLog("有物品离开")
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}

