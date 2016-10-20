//
//  WBComposeViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBComposeViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.close))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.compose))
        
        let inputView = WBInputTextView(frame: self.view.frame)
        inputView.placeholder = "请输入要分享的内容..."
        inputView.alwaysBounceVertical = true
        inputView.delegate = self
        self.view.addSubview(inputView)
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func compose() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextView delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
}
