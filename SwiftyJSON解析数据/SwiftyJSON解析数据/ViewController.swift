//
//  ViewController.swift
//  SwiftyJSON解析数据
//
//  Created by Lei Zhao on 8/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://localhost/demo.json")
        
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            
            
//            NSLog("\(error)")
            
            let json = JSON(data: data!)
            
            print("\(json["message"])")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

