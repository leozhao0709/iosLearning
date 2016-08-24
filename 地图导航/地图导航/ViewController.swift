//
//  ViewController.swift
//  地图导航
//
//  Created by Lei Zhao on 8/23/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var destinationTf: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let localtionManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if #available(iOS 8.0, *) {
            localtionManager.requestWhenInUseAuthorization()
        }
        
        self.mapView.delegate = self
        self.mapView.userTrackingMode = .Follow
        self.mapView.showsUserLocation = true
        
    }
    
//    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
//        let startAnotation = Annotation(coordinate: self.mapView.userLocation.coordinate)
//        NSLog("\(self.mapView.userLocation.coordinate)")
//        self.mapView.addAnnotation(startAnotation)
//    }

    @IBAction func startNavClick(sender: UIButton) {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(self.destinationTf.text!) { (placemarks, error) in
            
            if placemarks?.count == 0 || error != nil {
                NSLog("error")
                return
            }
            
            if let placemark = placemarks?[0] {
                
                let mkPm = MKPlacemark(placemark: placemark)
                
                let destination = MKMapItem(placemark: mkPm)
                
                let destinationAnotation = Annotation(coordinate: (placemark.location?.coordinate)!)
                self.mapView.addAnnotation(destinationAnotation)
                
                let startItem = MKMapItem.mapItemForCurrentLocation()
                let startAnotation = Annotation(coordinate: self.mapView.userLocation.coordinate)
                NSLog("\(self.mapView.userLocation.coordinate)")
                self.mapView.addAnnotation(startAnotation)
                
                let latitudeRegionDegree = 0.021256
                let longtitudeRegionDegree = 0.016093
                let span = MKCoordinateSpanMake(latitudeRegionDegree * 50, longtitudeRegionDegree * 50)
                self.mapView.region = MKCoordinateRegionMake(self.mapView.userLocation.coordinate, span)
                

                //这里会调用系统的地图
//                let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: MKMapType.Hybrid.rawValue, MKLaunchOptionsShowsTrafficKey: true]
//                MKMapItem.openMapsWithItems([startItem, destination], launchOptions: options as? [String : AnyObject])
                
                let request = MKDirectionsRequest()
                request.source = startItem
                request.destination = destination
                
                let directions = MKDirections(request: request)
                
                directions.calculateDirectionsWithCompletionHandler({ (response :MKDirectionsResponse?, error:NSError?) in
                    if (response?.routes.count == 0 || error != nil) {
                        NSLog("error")
                        return
                    }
                    
                    //获取路线信息
                    for route in (response?.routes)! {
                        //折线
                        let polyline = route.polyline
                        
                        //添加到地图
                        self.mapView.addOverlay(polyline)
                    }
                })
                
            }
        }
        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polyline = MKPolylineRenderer(overlay: overlay)
        
        //必须写颜色
        polyline.strokeColor = UIColor.purpleColor()
        
        polyline.lineWidth = 10
        
        return polyline
    }

}

