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
    
    
    /// file system
    ///
    /// - returns: file path
    func addToDocumentDir()->String? {
        return self.addToDir(dir: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!)
    }
    
    func addToCacheDir()->String? {
        return self.addToDir(dir: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!)
    }
    
    func addToTempDir()->String? {
        return self.addToDir(dir: NSTemporaryDirectory())
    }
    
    func addToDir(dir: String)->String {
        return (dir as NSString).appendingPathComponent(self)
    }
    
}
