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
        
        let imageView = UIImageView()
        
        imageView.center = CGPointMake(self.view.bounds.width/2, self.view.bounds.height/2)
        imageView.bounds.size = CGSizeMake(200, 200)
        imageView.backgroundColor = UIColor.greenColor()
        
        let image = UIImage(named: "6")!.circleImage()!
        
        
//        imageView.image = image.addText("lzhao", font: UIFont.systemFontOfSize(20) , textColor: UIColor.orangeColor(), position: CGPointMake(image.size.width/2, image.size.height/2)).circleImage()
        
        imageView.image = image.addTextInCenter("lzhao", font: UIFont.systemFontOfSize(20), textColor: UIColor.orangeColor())
        
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

