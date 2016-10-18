//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJExtension

class WBHomeViewController: WBBaseTableViewController {
    
    weak var titleBtn: UIButton?
    
    var status:[WBStatus] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNav()
        
        if self.defaultCenterView != nil {
            self.defaultCenterView?.iconImage = #imageLiteral(resourceName: "visitordiscover_feed_image_house")
            self.defaultCenterView?.info = "当你关注一些人以后, 他们发布的最新消息会显示在这里"
        } else {
            self.setupUserInfo()
            
            self.loadNewStatuses()
        }
    }
    
    private func setupUserInfo() {
        
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        let account = WBAccount.accountFromSandbox()
        
        var parameters:[String: Any] = [:]
        parameters["access_token"] = account?.access_token!
        parameters["uid"] = account?.uid!
        
        Alamofire.request(urlString, method: .get, parameters: parameters).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
//                printLog(message: "\(value)")
                let json = JSON(value)
                
                if account?.profile_image_url == json["profile_image_url"].string {
                    printLog(message: "don't need update profile image url")
                    return
                }
                
                account?.profile_image_url = json["profile_image_url"].string
                
                if (account?.save())! {
                    printLog(message: "save new profile image url")
                } else {
                    printLog(message: "save profile image url fail")
                }
            case .failure(let error):
                printLog(message: "\(error)")
            }
            
        }
        
    }
    
    private func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_friendsearch"), highlightImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(self.friendSearch))
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(normalImage: UIImage(named: "navigationbar_pop"), highlightImage: UIImage(named: "navigationbar_pop_highlighted"), target: self, action: #selector(self.scan))
        
        let titleBtn = WBTitleButton()
        titleBtn.setTitle("首页", for: .normal)
        titleBtn.setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), highlightImage: nil, selectedImage: #imageLiteral(resourceName: "navigationbar_arrow_up"))
        titleBtn.sizeToFit()
        titleBtn.addTarget(self, action: #selector(self.titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        
        self.navigationItem.titleView = titleBtn
        
        self.titleBtn = titleBtn
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if self.defaultCenterView != nil {
            super.viewWillAppear(animated)
            self.defaultCenterView?.startTurnTableRotate()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.defaultCenterView != nil {
            super.viewWillDisappear(animated)
            self.defaultCenterView?.stopTurnTableRotate()
        }
    }
    
    private func loadNewStatuses() {
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        var parameters:[String: Any] = [:]
        parameters["access_token"] = WBAccount.accountFromSandbox()?.access_token as String?
        
        Alamofire.request(urlString, method: .get, parameters: parameters).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                printLog(message: "\(value)")
                let json = JSON(value)
                let newStatus = json["statuses"].arrayObject
                for object in newStatus!{
                    self.status.append(WBStatus.mj_object(withKeyValues: object) )
                }
                self.tableView.reloadData()
            case .failure(let error):
                printLog(message: "\(error)")
            }
        }
    }

    
    @objc private func titleBtnClick(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        
        let menuView = WBHomeMenuView()
        
        WBPopMenu.popFromView(fromView: btn, menuContentView: menuView) {
            btn.isSelected = !btn.isSelected
        }
        
    }
    
    @objc fileprivate func friendSearch() {
        printLog(message: #function)
    }
    
    @objc fileprivate func scan() {
        printLog(message: #function)
        
        let scanVC = WBScanViewController()
        self.present(scanVC, animated: true, completion: nil)
    }
    
    //MARK: - tableView dataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.status.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
           cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        }
        
        let status = self.status[indexPath.row]
        
        let user = status.user
        cell?.textLabel?.text = user?.name as String?
        cell?.detailTextLabel?.text = status.text as String?
        
        let url = URL(string: (user?.profile_image_url)! as String)
        cell?.imageView?.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "avatar_default"))
        
        return cell!
    }

}
