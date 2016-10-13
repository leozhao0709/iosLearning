//
//  WBBaseTableViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBBaseTableViewController: UITableViewController, WBDefaultCenterViewDelegate{
    
    weak var defaultCenterView: WBDefaultCenterView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WBAccount.accountFromSandbox() != nil {
            super.loadView()
        } else {
            let defaultCenterView = WBDefaultCenterView.defaultCenterView()
            self.defaultCenterView = defaultCenterView
            self.view = defaultCenterView
            
            self.defaultCenterView?.delegate = self
        }
    }
    
    //MARK: - WBDefaultCenterViewDelegate
    func defaultCenterView(defaultCenterView: WBDefaultCenterView, didclickLogin loginBtn: UIButton) {
        let OAuthVC = WBOAuthViewController()
        let nav = WBNavigationController(rootViewController: OAuthVC)
        
        self.present(nav, animated: true, completion: nil)
    }
    
    func defaultCenterView(defaultCenterView: WBDefaultCenterView, didclickRegister registerBtn: UIButton) {
        
    }


}
