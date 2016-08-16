//
//  ViewController.swift
//  联网状态检测
//
//  Created by Lei Zhao on 8/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ViewController: UIViewController {
    
    var reach: Reachability!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // https://cocoapods.org/
            self.reach = try Reachability(hostname: "cocoapods.org")
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
            
            //开始监听
            do {
                try self.reach.startNotifier()
            }
            catch {
                
            }
            
        }
        catch {
            
        }
        
    }
    
    @objc private func reachabilityChanged() {
        //状态
        switch self.reach.currentReachabilityStatus {
        case .NotReachable:
            NSLog("没有连接")
        case .ReachableViaWiFi:
            NSLog("不用花钱")
        case .ReachableViaWWAN:
            NSLog("要流量")
            
        }
    }
    
    deinit {
        self.reach.stopNotifier()
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }


}

