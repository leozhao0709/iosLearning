//
//  WBComposeViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class WBComposeViewController: UIViewController, UITextViewDelegate {

    weak var input: WBInputTextView?
    
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
        self.input = inputView
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func compose() {
        var parameters:[String: Any] = [:]
        parameters["access_token"] = WBAccount.accountFromSandbox()?.access_token
        parameters["status"] = self.input?.text
        let url = "https://api.weibo.com/2/statuses/update.json"
        
        Alamofire.request(url, method: .post, parameters: parameters).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                printLog(message: "\(value)")
                self.inputView?.resignFirstResponder()
                self.dismiss(animated: true, completion: { 
                    KRProgressHUD.showSuccess(message: "发送成功")
                })
            case .failure(let error):
                printLog(message: "\(error)")
                KRProgressHUD.showError(message: "发送失败")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextView delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.navigationItem.rightBarButtonItem?.isEnabled = textView.text.characters.count > 0
    }
    
}
