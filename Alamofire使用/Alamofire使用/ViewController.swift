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
import SWXMLHash

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.getDemo()
//        self.getLogin()
        
//        self.getXML()
        
        self.postUpload()
    }
    
    private func getDemo() {
        
        let url = "http://localhost/videos.json";
        
        Alamofire.request(.GET, url, parameters: nil).validate().responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                NSLog("\(json) \(NSThread.currentThread())")
            case .Failure(let error):
                NSLog("\(error)")
            }
        }
        
        NSLog("完成")
        
    }
    
    private func getLogin() {
        
        let url = "http://localhost/login.php"
        
//        let json = JSON(arrayLiteral: ["username": "zhangsan", "password": "zhang"])
        
        let param = ["username": "zhangsan", "password": "zhang"]
        
        Alamofire.request(.POST, url, parameters: param).validate().responseJSON { (response) in
            switch response.result{
            case .Success(let value):
                NSLog("\(JSON(value)["userName"])")
            case .Failure(let error):
                NSLog("\(error)")
            }
        }
    }
    
    
    private func getXML() {
        
        let url = "http://localhost/videos.xml";
        
        Alamofire.request(.GET, url).validate().responseString { (response) in
            switch response.result {
            case .Failure(let error):
                NSLog("\(error)")
            case .Success(let value):
                let xml = SWXMLHash.lazy(value)
                NSLog("\(xml["videos"]["video"][1]["name"].element!.text!)")
            }
        }
        
        NSLog("完成")
        
    }
    
    private func postUpload() {
        
        let url = "http://localhost/post/upload.php"
        
        let fileURL = NSBundle.mainBundle().URLForResource("1.jpg", withExtension: nil)!
        
        /**
         *  此方法无法修改上传文件名称
         */
//        Alamofire.upload(.POST, url, multipartFormData: { (multipartFormData) in
//            multipartFormData.appendBodyPart(fileURL: fileURL, name: "userfile")
//            }) { (result) in
//                switch result {
//                case .Failure(let error):
//                    NSLog("failed")
//                case .Success(let value):
//                    NSLog("success")
//                }
//        }
        
        Alamofire.upload(.POST, url, multipartFormData: { (multipartFormData) in
            multipartFormData.appendBodyPart(fileURL: fileURL, name: "userfile", fileName: "123.jpg", mimeType: "image/jpg")
        }) { (result) in
                switch result {
                case .Failure(let error):
                    NSLog("failed")
                case .Success(let value):
                    NSLog("success")
                }
        }
     
        
    
    }


}

