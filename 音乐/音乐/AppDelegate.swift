//
//  AppDelegate.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var playerRemoteEventClosure: ((event: UIEvent)->Void)!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //要想在后台播放, 需要这里 和 applicationDidEnterBackground 和 plist
        let musicSession = AVAudioSession.sharedInstance()
        do{
            try musicSession.setCategory(AVAudioSessionCategoryPlayback)
            try musicSession.setActive(true)
        }
        catch let error as NSError {
            NSLog("music session error: \(error)")
        }
        
        //设置远程事件, 记得接收远程事件
        application.beginReceivingRemoteControlEvents()
        
        return true
    }
    
    //接收远程事件
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        if let event = event {
            if event.type == .RemoteControl {
                //subtype
                
//                case None
//                
//                // for UIEventTypeMotion, available in iPhone OS 3.0
//                case MotionShake
//                
//                // for UIEventTypeRemoteControl, available in iOS 4.0
//                case RemoteControlPlay
//                case RemoteControlPause
//                case RemoteControlStop
//                case RemoteControlTogglePlayPause
//                case RemoteControlNextTrack
//                case RemoteControlPreviousTrack
//                case RemoteControlBeginSeekingBackward
//                case RemoteControlEndSeekingBackward
//                case RemoteControlBeginSeekingForward
//                case RemoteControlEndSeekingForward
                
                self.playerRemoteEventClosure(event: event)
                
            }
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        application.beginBackgroundTaskWithExpirationHandler(nil)
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

