//
//  WBTabBarController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //child Controller
        self.setupAllChildController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:- Setup All child controller
    func setupAllChildController() {
        
        let home = UIViewController()
        self.setupChildControllerView(home, title: "首页", tabBarNormolImage: UIImage(named: "tabbar_home")!, tabBarSelectedImage: UIImage(named: "tabbar_home_selected")!)
        home.tabBarItem.badgeValue = nil
        home.view.backgroundColor = UIColor.greenColor()
        
        
        
        let message = UIViewController()
        self.setupChildControllerView(message, title: "消息", tabBarNormolImage: UIImage(named: "tabbar_message_center")!, tabBarSelectedImage: UIImage(named: "tabbar_message_center_selected")!)
        
         message.view.backgroundColor = UIColor.blueColor()
        
        let discover = UIViewController()
        self.setupChildControllerView(discover, title: "发现", tabBarNormolImage: UIImage(named: "tabbar_discover")!, tabBarSelectedImage: UIImage(named: "tabbar_discover_selected")!)
        
        discover.view.backgroundColor = UIColor.purpleColor()
        
        let profile = UIViewController()
        self.setupChildControllerView(profile, title: "我", tabBarNormolImage: UIImage(named: "tabbar_profile")!, tabBarSelectedImage: UIImage(named: "tabbar_profile_selected")!)
        
        profile.view.backgroundColor = UIColor.lightGrayColor()
        
        self.viewControllers = [home, message, discover, profile]
    }
    
    // MARK:- Setup one child controller view UI
    func setupChildControllerView(viewController: UIViewController, title: String?, tabBarNormolImage: UIImage, tabBarSelectedImage: UIImage) {
        
        viewController.tabBarItem.title = title
        
        let titleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
        viewController.tabBarItem.setTitleTextAttributes(titleAttribute, forState: .Selected)
        
        viewController.tabBarItem.setImageWithOriginalImage(tabBarNormolImage, selectedImage: tabBarSelectedImage)
        
    }

}
