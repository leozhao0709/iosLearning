//
//  ViewController.swift
//  图片裁剪并保存
//
//  Created by Lei Zhao on 7/30/16.
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
    
    
    @IBAction func clipButtonClick(sender: UIButton) {
        
        let image = UIImage(named: "dst2")
        
//        UIGraphicsBeginImageContextWithOptions((image?.size)!, false, 0.0)
//        
//        let ctx = UIGraphicsGetCurrentContext()
//        
//        let center = CGPointMake((image?.size.width)!/2, (image?.size.height)!/2)
//        let radius = min((image?.size.width)!, (image?.size.height)!)/2
//        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
//        
//        CGContextAddPath(ctx, path.CGPath)
//        
//        CGContextClip(ctx)
//        
//        image?.drawAtPoint(CGPointZero)
//        
//        var getImage = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//        
//        var x: CGFloat = 0
//        var y: CGFloat = ((image?.size.height)! - 2 * radius)/2
//        var w: CGFloat = 2 * radius
//        var h = w
//        
//        let scale = UIScreen.mainScreen().scale
//        
//        x *= scale
//        y *= scale
//        h *= scale
//        w *= scale
//        
//        let imageRef = CGImageCreateWithImageInRect(getImage.CGImage, CGRectMake(x, y, w, h))
//        
//        getImage = UIImage(CGImage: imageRef!)
        
        
        let getImage = image!.circleImage()!
        
//        self.imageView.image = getImage
        
        self.imageView.fadeImageIn(getImage)
        
        
        //保存至相册
//        UIImageWriteToSavedPhotosAlbum(getImage, self,#selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        
    }


}

