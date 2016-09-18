//
//  WBQrcodeView.swift
//  Weibo
//
//  Created by Lei Zhao on 9/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SnapKit

class WBQrcodeView: UIView {

    weak var scanBorderImageView: UIImageView?
    weak var scanImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    /**
     Just init different UI subviews here, no frame need here
     */
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        
        let scanBorderImageView = UIImageView()
        let qrcode_border_image = #imageLiteral(resourceName: "qrcode_border")
        
//        let resize_border_image = qrcode_border_image.resizableImage(withCapInsets: UIEdgeInsetsMake(qrcode_border_image.size.height/2, qrcode_border_image.size.width/2, qrcode_border_image.size.height/2, qrcode_border_image.size.width/2), resizingMode: UIImageResizingMode.stretch)
//        imageView.image = resize_border_image
        
        scanBorderImageView.image = qrcode_border_image
        self.addSubview(scanBorderImageView)
        self.scanBorderImageView = scanBorderImageView
        
        let scanImageView = UIImageView()
        scanImageView.image = #imageLiteral(resourceName: "qrcode_scanline_qrcode")
        self.addSubview(scanImageView)
        self.scanImageView = scanImageView
        
        self.scanImageView?.snp.makeConstraints({ (make) in
            make.height.equalTo(170)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(self).offset(-170)
        })
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        self.scanBorderImageView?.center = self.center
        self.scanBorderImageView?.frame = self.bounds
        
    }
    
    
}