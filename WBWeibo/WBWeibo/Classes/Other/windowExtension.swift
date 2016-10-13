//
//  windowExtension.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func chooseRootViewController() {
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let defaults = UserDefaults.standard
        let sandboxVersion = defaults.object(forKey: "CFBundleShortVersionString") as? String
        
        if sandboxVersion == nil || currentVersion.compare(sandboxVersion!) == .orderedDescending {
            defaults.set(currentVersion, forKey: "CFBundleShortVersionString")
            defaults.synchronize()
            
            // new featrue page
            let newfeatureVc = WBNewfeatureViewController()
            self.rootViewController = newfeatureVc
            
        } else {
            // welcom page
            let welcomeVc = WBWelcomeViewController()
            self.rootViewController = welcomeVc
        }

    }
    
}
