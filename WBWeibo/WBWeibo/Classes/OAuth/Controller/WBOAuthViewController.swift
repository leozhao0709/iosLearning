//
//  WBOAuthViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import KRProgressHUD
import Alamofire
import SwiftyJSON
import MJExtension

class WBOAuthViewController: UIViewController, UIWebViewDelegate {

    override func loadView() {
        self.view = UIWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.close))
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.orange
        
        self.loadOAuthPage()
        
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadOAuthPage() {
        
        let urlString = "\(WBAuthorizeUrl)?client_id=\(WBClientId)&redirect_uri=\(WBRedirectUrl)"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        let webView = self.view as! UIWebView
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    private func getAccessTokenWithCode(code: String) {
        
        let paramters = ["client_id": WBClientId, "client_secret": WBClientSecret, "grant_type": "authorization_code", "code":code, "redirect_uri": WBRedirectUrl]
        
        Alamofire.request(WBAccessTokenUrl, method: .post, parameters: paramters).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                /*
                 {
                 "access_token" = "2.00M_yAFCMfl6sD6319ed83f6oJA4lB";
                 "expires_in" = 157679999;
                 "remind_in" = 157679999;
                 uid = 1906379174;
                 }
                 */
                
                printLog("\(value)")
                
//                let json = JSON(value)
                
                let account = WBAccount.mj_object(withKeyValues: value)!
                printLog("\(account)")
                account.save()
                
            case .failure(let error):
                printLog("\(error)")
            }
        }
        
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        printLog("\(request.url?.absoluteString)")
        
        let urlString = request.url?.absoluteString
        let range = urlString?.localizedStandardRange(of: "code=")
        
        if let range = range{
            let startIndex = range.upperBound
            let code = urlString?.substring(from: startIndex)
            self.getAccessTokenWithCode(code: code!)
            return false
        }
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        KRProgressHUD.show(message: "Loading...")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        KRProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        KRProgressHUD.dismiss()
    }


}
