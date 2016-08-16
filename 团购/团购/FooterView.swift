//
//  FooterView.swift
//  团购
//
//  Created by Lei Zhao on 7/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

protocol FooterViewDelegate {
    func footerView(footerView: FooterView)
}

class FooterView: UIView {

    @IBOutlet weak var loadMoreView: UIView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var delegate: FooterViewDelegate?

    @IBAction func didClickLoadButton(sender: UIButton) {
        
//        loadMoreView.alpha = 1
//        activityView.startAnimating()
        
        self.delegate?.footerView(self)
    }
    
    func showLoadView(isShow: Bool) {
        
        if isShow {
            loadMoreView.alpha = 1
            activityView.startAnimating()
        }
        else
        {
            loadMoreView.alpha = 0
            activityView.stopAnimating()
        }
    }
}
