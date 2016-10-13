//
//  CZNavigationController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/8/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZNavigationController: UINavigationController {
    
    static var initialStart: Bool = {
        NSLog("xxxxx")
        
        /**设置导航条注意点
         * 1. 在ios7以上，背景图片高度一定要是64(点， 不是像素(128, 256))
         * 2. 背景图片高度无限制，会自动拉伸
         * 3. 如果是通过导航控制器获取导航条，那是局部的
         * 4. 如果想设置一次导航栏的背景，这个导航条的对象，通过导航条的一个类方法获取对象，就可以 UINavigationBar.appearance()
         */
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
        
        //全局样式, 可以写进AppDelegate
        //一般不会在自控制器里设置导航条
        
        let navBar = UINavigationBar.appearance()
        
        //1. 设置背景
        navBar.setBackgroundImage(UIImage(named: "NavBar64"), for: .default) //此方法连写没代码提示0.0
        
        //2. UIApplication设置状态栏样式, 需要添加 View controller-based status bar appearance 进info.plist
        UIApplication.shared.statusBarStyle = .lightContent
        
        //3. 设置导航条的字体和颜色
        let titleAttr = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 24)]
        
        navBar.titleTextAttributes = titleAttr
        //设置返回按钮的样式
        navBar.tintColor = UIColor.white
        
        
        let navItem = UIBarButtonItem.appearance()
        navItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15)], for: UIControlState())
        
//        //改变整个按钮
//        navItem.setBackgroundImage(<#T##backgroundImage: UIImage?##UIImage?#>, forState: <#T##UIControlState#>, barMetrics: <#T##UIBarMetrics#>)
        
        
        return true
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CZNavigationController.initialStart = true
        
        NSLog("\(#function)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    //状态栏样式一定要在导航控制器里设置，不能在子控制器里设置
//    //这种方式只能针对局部的控制器,如果要全局设置，添加 View controller-based status bar appearance 进info.plist 然后添加UIApplication.sharedApplication().statusBarStyle
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        return super.pushViewController(viewController, animated: animated)
    }

}
