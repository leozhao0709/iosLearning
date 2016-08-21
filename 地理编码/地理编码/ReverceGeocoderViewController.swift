//
//  ReverceGeocoderViewController.swift
//  地理编码
//
//  Created by Lei Zhao on 8/21/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreLocation

class ReverceGeocoderViewController: UIViewController {

    @IBOutlet weak var latitudeTf: UITextField!
    @IBOutlet weak var longtitudeTf: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reverseGeocoderClick(sender: UIButton) {
        
        //1. 创建CLGeocoder对象
        let geocoder = CLGeocoder()
        
        //2. 创建位置对象
        let location = CLLocation(latitude: Double(self.latitudeTf.text!)!, longitude: Double(self.longtitudeTf.text!)!)
        
        //3. 调用反地理编码方法
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                
                //3.1 错误处理
                if (placemarks?.count)! == 0 || error != nil {
                    NSLog("解析错误")
                    return
                }
            
            for placemark in placemarks! {
                
                if let city = placemark.locality {
                    self.cityLabel.text = city
                }
                else {
                    self.cityLabel.text = placemark.administrativeArea //state
                }
                
            }
            
        }
        
    }
    
    

}
