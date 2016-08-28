//
//  ViewController.swift
//  加速计
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    //使用push 或者 pull 的方法
    let mgr = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    // MARK: - push的方法:需要设置时间间隔
    
    private func pushAccelerometer() {
        
        if !self.mgr.accelerometerAvailable {
            return
        }
        
        self.mgr.accelerometerUpdateInterval = 1/30.0

        self.mgr.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (accelerometerData, error) in
            if error != nil {
                return
            }

            if let acceleration = accelerometerData?.acceleration {
                NSLog("x: \(acceleration.x), y: \(acceleration.y), z: \(acceleration.z)")
            }
        }
    }
    
    // MARK: - pull 的方法: 一直采样，用的时候再获取数据，使用self.mgr.accelerometerData.acceleration来获取
    
    private func pullAccelerometer() {
        if !self.mgr.accelerometerAvailable {
            return
        }
        
        self.mgr.startAccelerometerUpdates()
    }

}

