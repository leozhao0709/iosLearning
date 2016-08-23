//
//  ViewController.swift
//  显示大头针(map)
//
//  Created by Lei Zhao on 8/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let annotation1 = Annotation(coordinate: CLLocationCoordinate2DMake(23.11, 113.27), title: "GuangZhou", subtitle: "intersting place")
        let annotation2 = Annotation(coordinate: CLLocationCoordinate2DMake(40.06, 116.39), title: "BeiJing", subtitle: "amazing place")
        
        
        self.mapView.addAnnotation(annotation1)
        self.mapView.addAnnotation(annotation2)
        
        self.mapView.delegate = self
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //1. 获取点击的点
        
        let point = touches.first?.locationInView(self.mapView)
        
        // 2. 获取点击点的经纬度
        let coordinate = self.mapView.convertPoint(point!, toCoordinateFromView: self.mapView)
        
        var title: String = ""
        var subtitle: String = ""
        
        //3. 反地理编码
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)){ (placemarks, error) in
            if error != nil {
                return
            }
            
            if let placemark = placemarks?[0] {
                if let city = placemark.locality {
                    title = city
                } else {
                    title = placemark.administrativeArea!
                }
                subtitle = placemark.name!
            }
        }
        
        let annotation = Annotation(coordinate: coordinate, title: title, subtitle: subtitle)
        
        self.mapView.addAnnotation(annotation)
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        //此方法如果返回nil, 代表系统就会自己用默认的东西
        
        //系统默认显示用户位置的光圈不需要自定义view
        //MKUserLocation是系统自定义大头针
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        let id = "annotationView"
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            
//            annotationView?.pinColor = .Green
            
            annotationView?.pinTintColor = UIColor.blueColor()
            
            annotationView?.animatesDrop = true
        }
        
        return annotationView
    }


}

