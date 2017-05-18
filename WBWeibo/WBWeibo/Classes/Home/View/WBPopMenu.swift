//
//  WBPopMenuView.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBPopMenu: NSObject {
    
    static var popMenuWindow: UIWindow?
    
    private static var dismiss: (()->Void)?
    
    /// popup menu (use UIWindow)
    ///
    /// - parameter fromView: menu point view
    /// - parameter contentView:  menu content view
    /// - parameter dismiss: menu dismiss closure
    static func popFromView(fromView: UIView, menuContentView contentView: UIView, dismiss: (()->Void)?) {
        
        WBPopMenu.dismiss = dismiss
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.isHidden = false
//        window.windowLevel = UIWindowLevelAlert //根据情况,可以不添加
        let viewController = UIViewController();
        window.rootViewController = viewController;
        WBPopMenu.popMenuWindow = window
        
        
        let cover = UIButton(frame: UIScreen.main.bounds)
        cover.backgroundColor = UIColor.clear
        cover.addTarget(self, action: #selector(coverClick), for: UIControlEvents.touchUpInside)
        viewController.view.addSubview(cover);
        
        cover.addSubview(contentView)
        
        let resultFrame = window.convert(fromView.frame, from: fromView.superview)
        contentView.y = resultFrame.maxY
        contentView.centerX = resultFrame.origin.x + resultFrame.size.width * 0.5
        
    }
    
    
    @objc static func coverClick() {
        for view in (WBPopMenu.popMenuWindow?.subviews)! {
            view.removeFromSuperview()
        }
        
        WBPopMenu.popMenuWindow = nil
        if let dismiss = self.dismiss {
            dismiss()
        }
    }
    
}
