//
//  ViewController.swift
//  联网状态检测
//
//  Created by Lei Zhao on 8/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var reach: Reachability!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // https://cocoapods.org/
            self.reach = try Reachability(hostname: "cocoapods.org")
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
            
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
    
    @objc fileprivate func reachabilityChanged() {
        //状态
        switch self.reach.currentReachabilityStatus {
        case .notReachable:
            NSLog("没有连接")
        case .reachableViaWiFi:
            NSLog("不用花钱")
        case .reachableViaWWAN:
            NSLog("要流量")
            
        }
    }
    
    deinit {
        self.reach.stopNotifier()
        NotificationCenter.default.removeObserver(self)
    }


}

