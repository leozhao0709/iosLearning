//
//  CZWebViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZWebViewController: UIViewController, UIWebViewDelegate {

    weak var webView: UIWebView?
    
    var htmlPage: CZHtmlPage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "网页"
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.btnClick))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func btnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        let webView = UIWebView()
        self.view = webView
        webView.delegate = self
        self.webView = webView
        
//        let url = NSURL(string: <#T##String#>)
        
        let url = Bundle.main.url(forResource: self.htmlPage?.html, withExtension: nil)
        let request = URLRequest(url: url!)
        self.webView?.loadRequest(request)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        let js = "window.location.href='#\(self.htmlPage!.ID)'"
        NSLog("\(js)")
        webView.stringByEvaluatingJavaScript(from: js)
    }

}
