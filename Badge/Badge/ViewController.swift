//
//  ViewController.swift
//  Badge
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 63, width: 200, height: 300))
        
        imageView.backgroundColor = UIColor.greenColor()
        
        let image = UIImage(named: "img05")
        
        
//        imageView.image = image.addText("lzhao", font: UIFont.systemFontOfSize(20) , textColor: UIColor.orangeColor(), position: CGPointMake(image.size.width/2, image.size.height/2)).circleImage()
        
        let textImage = image!.addTextInCenter("爱我别走，如果你不爱我", font: UIFont.systemFontOfSize(25), textColor: UIColor.orangeColor())
        
        let logoImage = UIImage(named: "logo")
        
        let newImage = textImage.addImage(logoImage!, position: CGPoint(x: 600, y: 700))
        
        imageView.image = newImage
        
        self.imageView = imageView
        
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

