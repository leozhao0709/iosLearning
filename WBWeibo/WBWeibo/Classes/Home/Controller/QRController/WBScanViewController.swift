//
//  WBScanViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/16/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SnapKit

class WBScanViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let qrcodeViewController = WBQrcodeViewController()
        self.setupChildController(qrcodeViewController, title: "二维码", tabBarNormolImage: UIImage(named: "qrcode_tabbar_icon_qrcode")!, tabBarSelectedImage: UIImage(named: "qrcode_tabbar_icon_qrcode_highlighted")!)
        
        let barcodeViewController = WBBarcodeViewController()
        self.setupChildController(barcodeViewController, title: "条形码", tabBarNormolImage: UIImage(named: "qrcode_tabbar_icon_barcode")!, tabBarSelectedImage: UIImage(named: "qrcode_tabbar_icon_barcode_highlighted")!)
        
        self.tabBar.backgroundImage = UIImage(named: "qrcode_tabbar_background")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    fileprivate func setupChildController(_ viewController: UIViewController, title: String?, tabBarNormolImage: UIImage, tabBarSelectedImage: UIImage){
        
        viewController.title = title
        
        viewController.tabBarItem.setTitleTextColor(UIColor.gray, selectedColor: UIColor.orange)
        
        
        viewController.tabBarItem.setImageWithOriginalImage(tabBarNormolImage, selectedImage: tabBarSelectedImage)
        
        let nav = WBScanNavigationController(rootViewController: viewController)
        
        self.addChildViewController(nav)
        
    }
    
    deinit {
        printLog("scan tabar controller close")
    }

}
