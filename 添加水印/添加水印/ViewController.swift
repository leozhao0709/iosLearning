//
//  ViewController.swift
//  添加水印
//
//  Created by Lei Zhao on 7/31/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func waterBtnClick(sender: UIButton) {
        
        let image = UIImage(named: "img05")
        
        UIGraphicsBeginImageContextWithOptions((image?.size)!, false, 0.0)
        
        image?.drawInRect(CGRectMake(0, 0, (image?.size.width)!, (image?.size.height)!))
        
        let text: NSString = "爱我别走，如果你不爱我"
        
        let attrs = [NSForegroundColorAttributeName:UIColor.redColor(), NSFontAttributeName: UIFont.systemFontOfSize(25)]
        
        text.drawInRect(CGRectMake(200, 500, 300, 200), withAttributes: attrs)
        
        let logoImage = UIImage(named: "logo")
        logoImage?.drawInRect(CGRectMake(300, 700, 101, 38))
        
        let getImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        imageView.image = getImage
        
    }

}

