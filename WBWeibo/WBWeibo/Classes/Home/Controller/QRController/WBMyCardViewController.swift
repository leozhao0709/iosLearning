//
//  WBMyCardViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBMyCardViewController: UIViewController {

    @IBOutlet weak var qrcodeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let qrcode = "Lei Zhao"
        self.qrcodeImageView.image =  qrcode.generateQrCodeImage(size: self.qrcodeImageView.frame.size)
    }
    

}
