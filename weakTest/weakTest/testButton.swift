//
//  testButton.swift
//  weakTest
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class TestButton: UIButton {

    deinit {
        NSLog("按钮 \(self.currentTitle) 被释放了")
    }

}
