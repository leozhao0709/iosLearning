//
//  ViewController.swift
//  SnipKit介绍
//
//  Created by Lei Zhao on 7/23/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
        
        /**
         *  第一种写法
         */
//        redView.snp_makeConstraints { (make) in
//            make.top.equalTo(self.view.snp_top).offset(20)
//            make.left.equalTo(self.view.snp_left).offset(20)
//            make.right.equalTo(self.view.snp_right).offset(-20)
//            make.height.equalTo(40)
//        }
        
        
        /**
         第二种写法
         */
//        redView.snp_makeConstraints { (make) in
//            make.top.equalTo(self.view).offset(20)
//            make.left.equalTo(self.view).offset(20)
//            make.right.equalTo(self.view).offset(-20)
//            make.height.equalTo(40)
//        }
        
        /**
         第三种写法
         */
        
//        redView.snp_makeConstraints { (make) in
//            make.top.left.equalTo(self.view).offset(20)
//            make.right.equalTo(self.view).offset(-20)
//            make.height.equalTo(40)
//        }
        
        /**
         *  第四种
         */
        redView.snp_makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }
        
//        redView.snp_updateConstraints { (make) in
//            make.height.equalTo(80)
//        }
//        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        
         self.view.addSubview(blueView)

        blueView.snp_makeConstraints { (make) in
            make.top.equalTo(redView.snp_bottom).offset(20)
            make.right.equalTo(redView).offset(0)
            make.height.equalTo(redView)
            make.width.equalTo(redView).multipliedBy(0.5)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

