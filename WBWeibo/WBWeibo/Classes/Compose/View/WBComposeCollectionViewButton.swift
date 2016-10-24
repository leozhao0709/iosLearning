//
//  WBComposeCollectionViewButton.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/23/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBComposeCollectionViewButton: UIButton {

    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }

}
