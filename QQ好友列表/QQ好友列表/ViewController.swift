//
//  ViewController.swift
//  QQ好友列表
//
//  Created by Lei Zhao on 7/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, HeaderViewDelegate {
    
    private lazy var dataArray:[GroupsModel]! = {
        let path = NSBundle.mainBundle().pathForResource("friends.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var groupsModelArray:[GroupsModel] = []
        
        for dict in tempArray! {
            let groupsModel = GroupsModel(dict: dict as! [String: AnyObject])
            
            groupsModelArray.append(groupsModel)
        }
        
        return groupsModelArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.separatorStyle = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groups = self.dataArray[section]
        return groups.isFolding ? 0:groups.friends.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "QQCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? QQCell
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("QQCell", owner: nil, options: nil).last as? QQCell
        }
        
        let groupModel = self.dataArray[indexPath.section]
        let friendsModel = groupModel.friends[indexPath.row]
        
        cell!.friendsModel = friendsModel
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let identifier = "headerView"
        var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(identifier) as? HeaderView
        
        if headerView == nil {
            headerView = HeaderView(reuseIdentifier: identifier)
            
            headerView?.delegate = self
        }
        
        let groupModel = self.dataArray[section]
        
        headerView?.groupModel = groupModel
        
        headerView?.tag = section
        
        headerView?.rotateImageView = !groupModel.isFolding
        
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func HeaderViewDidClickButton(headerView: HeaderView, button: UIButton) {
//        headerView.rotateImageView = true
        
        let section = headerView.tag
        
        let groupModel = self.dataArray[section]
        groupModel.isFolding = !groupModel.isFolding
        
        let indexSet = NSIndexSet(index: section)
        
        self.tableView.reloadSections(indexSet, withRowAnimation: .Fade)
        
    }
}

