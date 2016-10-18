//
//  WBWelcomeViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SDWebImage

class WBWelcomeViewController: UIViewController {

    @IBOutlet weak var iconConsY: NSLayoutConstraint!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.iconImageView.layer.cornerRadius = 50
        self.iconImageView.layer.masksToBounds = true
        
        let account = WBAccount.accountFromSandbox()
        if let url = account?.profile_image_url {
            let iconUrl = URL(string: url)
//            self.iconImageView.sd_setImage(with: iconUrl, placeholderImage: #imageLiteral(resourceName: "avatar_default"))
            
            let SDManager = SDWebImageManager.shared()
            
            _ = SDManager?.downloadImage(with: iconUrl, options: [], progress: nil, completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, finished: Bool, imageUrl: URL?) in
                if finished {
                    self.iconImageView.image = image
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.iconConsY.constant -= 150
            self.view.layoutIfNeeded()
            }) { (finished) in
                UIView.animate(withDuration: 1, animations: {
                    self.welcomeBackLabel.alpha = 1
                    }, completion: { (finished) in
                        let tabbarVC = WBTabBarController()
                        let window = UIApplication.shared.keyWindow
                        window?.rootViewController = tabbarVC
                })
        }
        
    }

}
