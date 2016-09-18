//
//  WBQrcodeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/16/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBQrcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(self.closeBtnClick))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "相册", style: .plain, target: self, action: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func closeBtnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
