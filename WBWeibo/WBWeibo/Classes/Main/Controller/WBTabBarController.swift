//
//  WBTabBarController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/4/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBTabBarController: UITabBarController, WBTabBarDelegate {

    
    weak var customerTabBar: WBTabBar?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //child Controller
        
        self.setupAllChildController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let tabBar = WBTabBarSystem(frame: self.tabBar.frame)
//        self.setValue(tabBar, forKey: "tabBar")
        
        let tabBar = WBTabBar(frame: self.tabBar.frame)
        self.view.addSubview(tabBar)
        tabBar.delegate = self
        self.customerTabBar = tabBar
        
        //记得remove掉
        self.tabBar.removeFromSuperview()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:- Setup All child controller
    func setupAllChildController() {
        
        let home = WBHomeViewController()
        self.setupChildControllerView(home, title: "首页", tabBarNormolImage: UIImage(named: "tabbar_home")!, tabBarSelectedImage: UIImage(named: "tabbar_home_selected")!)
        
        home.view.backgroundColor = UIColor.green
        
        
        
        let message = WBMessageViewController()
        message.tabBarItem.badgeValue = "3"
        self.setupChildControllerView(message, title: "消息", tabBarNormolImage: UIImage(named: "tabbar_message_center")!, tabBarSelectedImage: UIImage(named: "tabbar_message_center_selected")!)
        
        message.view.backgroundColor = UIColor.blue
        
        let discover = WBDiscoverViewController()
        self.setupChildControllerView(discover, title: "发现", tabBarNormolImage: UIImage(named: "tabbar_discover")!, tabBarSelectedImage: UIImage(named: "tabbar_discover_selected")!)
        
        discover.view.backgroundColor = UIColor.purple
        
        let profile = WBProfileViewController()
        self.setupChildControllerView(profile, title: "我", tabBarNormolImage: UIImage(named: "tabbar_profile")!, tabBarSelectedImage: UIImage(named: "tabbar_profile_selected")!)
        
        profile.view.backgroundColor = UIColor.lightGray
        
    }
    
    
    // MARK:- Setup one child controller view UI
    func setupChildControllerView(_ viewController: UIViewController, title: String?, tabBarNormolImage: UIImage, tabBarSelectedImage: UIImage) {
        
        viewController.title = title
        
        let titleAttribute: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.orange]
        
        viewController.tabBarItem.setTitleTextAttributes(titleAttribute, for: .selected)
        
        viewController.tabBarItem.setImageWithOriginalImage(tabBarNormolImage, selectedImage: tabBarSelectedImage)
        
        self.customerTabBar?.addItem(viewController.tabBarItem)
        
        let nav = UINavigationController.init(rootViewController: viewController)
        
        self.addChildViewController(nav)
    }
    
    func tabBar(_ tabBar: WBTabBar, from: Int, to: Int) {
//        printLog("from \(from) to \(to)")
        self.selectedIndex = to
    }
}
