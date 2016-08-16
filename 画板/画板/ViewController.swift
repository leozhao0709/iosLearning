//
//  ViewController.swift
//  画板
//
//  Created by Lei Zhao on 7/31/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var paintView: CZPaint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clear(sender: UIButton) {
        self.paintView.clear()
    }

    @IBAction func back(sender: UIButton) {
        self.paintView.back()
    }
    
    @IBAction func save(sender: UIButton) {
        
        //1.截屏
        let image = self.paintView.clipViewToImage()
        
        //2.保存到相册
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        if (error != nil) {
            KRProgressHUD.showError(progressHUDStyle: KRProgressHUDStyle.Black, maskType: KRProgressHUDMaskType.Black, activityIndicatorStyle: KRProgressHUDActivityIndicatorStyle.Black, font: UIFont.systemFontOfSize(15), message: "保存失败")
        }
        else {
            KRProgressHUD.showSuccess(progressHUDStyle: KRProgressHUDStyle.BlackColor, maskType: KRProgressHUDMaskType.Black, activityIndicatorStyle: KRProgressHUDActivityIndicatorStyle.Black, font: UIFont.systemFontOfSize(15), message: "保存成功")
        }
    }
    
    
}

