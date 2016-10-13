//
//  WBDiscoverViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBDiscoverViewController: UITableViewController, UITextFieldDelegate {
    
    weak var searchBar: WBSearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = WBSearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        self.navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        self.searchBar = searchBar
    }
    
    //MARK: textField delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancel))
        
        self.searchBar?.leftIcon = #imageLiteral(resourceName: "settings_statistic_triangle")
    }
    
    @objc private func cancel() {
        self.navigationItem.rightBarButtonItem = nil
        UIApplication.shared.keyWindow?.endEditing(true)
        
        self.searchBar?.leftIcon = #imageLiteral(resourceName: "searchbar_searchlist_search_icon")
    }
    
    //MARK: - scrollView delegate
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
