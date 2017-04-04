//
//  ViewController.swift
//  MapView的基本使用
//
//  Created by Lei Zhao on 8/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1. 请求授权
        if #available(iOS 8.0, *) {
            self.manager.requestWhenInUseAuthorization()
        }
        
        //2. 显示用户位置 -->获取经纬度 --> 定位
        self.mapView.userTrackingMode = .follow
        
        //3. 设置代理
        self.mapView.delegate = self
        
    }

//    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
//        
////        userLocation.title = "aaaaa"
////        userLocation.subtitle = "bbbbbbb"
//        
//        let geocoder = CLGeocoder()
//        
//        geocoder.reverseGeocodeLocation(userLocation.location!) { (placemarks, error) in
//            if placemarks?.count == 0 || error != nil {
//                return
//            }
//            
//            for placemark in placemarks! {
//                if let place = placemark.locality {
//                    userLocation.title = place
//                } else {
//                    userLocation.title = placemark.administrativeArea
//                }
//                
//                userLocation.subtitle = placemark.name
//            }
//        }
//        
//        
//        NSLog("localtion: \(userLocation.location!)")
//    }

    @IBAction func switchMapTypeClick(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = .standard
        case 1:
            self.mapView.mapType = .satellite
        case 2:
            self.mapView.mapType = .hybrid
        case 3:
            if #available(iOS 9.0, *) {
                self.mapView.mapType = .satelliteFlyover
            }
        case 4:
            if #available(iOS 9.0, *) {
                self.mapView.mapType = .hybridFlyover
            }
        default: break
        }
    }
    
    @IBAction func backUserLocationClick(_ sender: UIButton) {
        
        //只能设置坐标
//        self.mapView.centerCoordinate = self.mapView.userLocation.coordinate
        
        //region 包含了经纬度和跨度
        let coordinate = self.mapView.userLocation.coordinate
        
        //参数是经纬度跨度
        // 1度大概是111KM
        
        //系统默认：
        //span: 0.021256, 0.016093 : 地图定位到用户位置之后, 第一次会显示的跨度大小
        // 双击放大 --> 显示跨度值变小一倍
        //span: 0.021256, 0.016093
        //span: 0.010628, 0.008047
        //span: 0.005314, 0.004023
        let span = MKCoordinateSpanMake(0.010628, 0.008047)
        self.mapView.region = MKCoordinateRegionMake(coordinate, span)
        
    }
    

}

