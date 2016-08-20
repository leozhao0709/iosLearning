//
//  ViewController.swift
//  Alamofire使用
//
//  Created by Lei Zhao on 8/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.getDemo()
    }
    
    private func getDemo() {
        
        let url = "http://localhost/videos.json";
        
        Alamofire.request(.GET, url, parameters: nil).validate().responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                NSLog("\(json)")
            case .Failure(let error):
                NSLog("\(error)")
            }
        }
        
        
    }


}

