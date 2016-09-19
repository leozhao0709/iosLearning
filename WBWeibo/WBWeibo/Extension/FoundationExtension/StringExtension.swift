//
//  StringExtension.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

extension String {
    
    
    /// Generate a QRCode from a string
    ///
    /// - parameter size: Generated Image Size
    ///
    /// - returns: QRCode image
    func generateQrCodeImage(size: CGSize)->UIImage {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        let data = self.data(using: String.Encoding.utf8)
        filter?.setValue(data, forKey: "inputMessage")
        
        let qrcodeCIImage = filter?.outputImage
        let qrcodeImage = qrcodeCIImage?.resizeAndGenerateImageFromCIImage(size: size)
        
        return qrcodeImage!
    }
    
}
