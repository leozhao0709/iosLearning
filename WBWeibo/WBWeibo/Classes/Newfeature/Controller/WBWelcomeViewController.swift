//
//  WBWelcomeViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBWelcomeViewController: UIViewController {

    @IBOutlet weak var iconConsY: NSLayoutConstraint!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.iconImageView.layer.cornerRadius = 50
        self.iconImageView.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, animations: { 
            self.iconConsY.constant -= 150
            self.view.layoutIfNeeded()
            }) { (finished) in
                UIView.animate(withDuration: 2, animations: { 
                    self.welcomeBackLabel.alpha = 1
                    }, completion: { (finished) in
                        let tabbarVC = WBTabBarController()
                        let window = UIApplication.shared.keyWindow
                        window?.rootViewController = tabbarVC
                })
        }
        
    }

}
