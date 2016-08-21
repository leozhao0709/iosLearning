//
//  ViewController.swift
//  一次定位
//
//  Created by Lei Zhao on 8/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    /// 需要配置plist: NSLocationWhenInUseUsageDescription 或者 NSLocationAlwaysUsageDescription
    
    //1. 创建管理器
    let localtionManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //2. 手动授权（ios8以后必须授权）
        
        //出现界面时候授权, 需要配置plist: NSLocationWhenInUseUsageDescription 或者 NSLocationAlwaysUsageDescription
        
        /**
         *  iOS7以前直接调用授权方法会崩溃，所以要做适配
         */
        
        /**
         *  iOS9新特性
            如果使用了requestWhenInUseAuthorization, 可以临时开启后台定位
         *
         */
        
        if self.localtionManager.respondsToSelector(#selector(CLLocationManager.requestWhenInUseAuthorization))
        {
            self.localtionManager.requestWhenInUseAuthorization()
            
            //一直允许定位
            self.localtionManager.requestAlwaysAuthorization()
        }
        
        /**
         iOS9允许后台更新位置
         需要两步: 1. code 2. plist文件: Required background modes
         */
        self.localtionManager.allowsBackgroundLocationUpdates = true
        
        
        //3.设置代理
        self.localtionManager.delegate = self
        
        //4.开始定位
        self.localtionManager.startUpdatingLocation()
        
        /**
         为了解决耗电问题，需要一些config
         */
        
        // 5. 位置筛选： 当位置发生一定变化后再调用代理
        //distanceFilter: 当位置变化超过10 meter再调用
        self.localtionManager.distanceFilter = 10
        
        /**
         定位的方式: GPS/北斗／基站定位／wifi
         */
        
        //6.设置精准度-->
        //desired:期望
        //accuracy: 精准度
        //kCLLocationAccuracyBest: xcode7以前默认的
        
        self.localtionManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localtion = locations[0]
        
//        NSLog("location: \(localtion)")
        
        NSLog("latitude: \(localtion.coordinate.latitude), longtitude: \(localtion.coordinate.longitude)")
        
//        self.localtionManager.stopUpdatingLocation()
        
    }


}

