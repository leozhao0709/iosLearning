//
//  GeocoderViewController.swift
//  地理编码
//
//  Created by Lei Zhao on 8/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreLocation

class GeocoderViewController: UIViewController {

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longtitudeLabel: UILabel!
    @IBOutlet weak var detailAddressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 地理编码点击
    @IBAction func geocoderBtnClick(sender: UIButton) {
        
        //1. 创建CLGeocoder对象
        let geocoder = CLGeocoder()
        
        if let address = self.addressTF.text {
            //2. 调用地理编码方法
            geocoder.geocodeAddressString(address) { (placemarks, error) in
                // placemarks 地标对象
                
                //3.1 错误处理
                if (placemarks?.count)! == 0 || error != nil {
                    NSLog("解析错误")
                    return
                }
                
                //3.2 遍历对象
                
                for placemark in placemarks! {
                    self.latitudeLabel.text = String(placemark.location!.coordinate.latitude)
                    self.longtitudeLabel.text = String(placemark.location!.coordinate.longitude)
                    self.detailAddressLabel.text = placemark.name
                }
                
                
                
            }
        }
        
        
    }


}
