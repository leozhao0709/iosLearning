//
//  ViewController.swift
//  localPushNotification
//
//  Created by Lei Zhao on 8/27/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func addLocalNotification(sender: UIButton) {
        
        //iOS 8 需要在appdelegate里设置获取权限
        
        let localNotification = UILocalNotification()
        
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        
        localNotification.alertBody = "吃了么？"
        
        localNotification.alertAction = "快点打开"
        
        localNotification.alertLaunchImage = "111"
        
        localNotification.soundName = UILocalNotificationDefaultSoundName
        
        localNotification.applicationIconBadgeNumber = 10 //如果只设置是不会消失的,可以通过appdelegate applicationDidBecomeActive来让其消失
        
        localNotification.userInfo = ["alertBody": localNotification.alertBody!, "applicationIconBadgeNumber": localNotification.applicationIconBadgeNumber] //在appdelegate中application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) 使用自定义数据
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }

}

