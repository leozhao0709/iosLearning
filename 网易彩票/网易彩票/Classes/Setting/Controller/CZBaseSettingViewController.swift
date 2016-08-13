//
//  CZBaseSettingViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZBaseSettingViewController: UITableViewController {

    var cellData: [CZSettingGroup] = []
    
    init() {
        super.init(style: UITableViewStyle.Grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(CZSettingViewController:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.cellData.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let group = self.cellData[section]
        
        return group.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = CZSettingCell.cellWithTableView(tableView)
        
        
        
        let group = self.cellData[indexPath.section]
        let item = group.items[indexPath.row]
        
        cell.item = item
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let group = self.cellData[indexPath.section]
        let item = group.items[indexPath.row]
        
        //判断item4
        if let completion = item.operation {
            completion()
        }
            
        else if let VC = item.vcClass {
            
            let viewController = (VC as! UIViewController.Type).init()
            
            viewController.title = item.title
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = self.cellData[section]
        return group.headerTitle
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let group = self.cellData[section]
        return group.footerTitle
    }

}
