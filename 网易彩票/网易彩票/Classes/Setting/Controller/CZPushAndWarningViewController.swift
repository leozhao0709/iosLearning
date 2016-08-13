//
//  CZPushAndWarningViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//


class CZPushAndWarningViewController: CZBaseSettingViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //第一组
        let item1 = CZSettingArrowItem(icon: nil, title: "开奖号码推送", vcClass: CZAwardNumPushViewController.self)
        let item2 = CZSettingArrowItem(icon: nil, title: "中奖动画", vcClass: CZAwardAnimationViewController.self)
        let item3 = CZSettingArrowItem(icon: nil, title: "比分直播提醒", vcClass: CZScoreLiveWarningViewController.self)
        let item4 = CZSettingArrowItem(icon: nil, title: "购彩定时提醒", vcClass: ViewController.self)
        
        let group1 = CZSettingGroup()
        group1.items = [item1, item2, item3, item4]
        self.cellData.append(group1)
        
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: - Table view data source
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return self.cellData.count
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        
//        let group = self.cellData[section]
//        
//        return group.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = CZSettingCell.cellWithTableView(tableView)
//        
//        
//        
//        let group = self.cellData[indexPath.section]
//        let item = group[indexPath.row]
//        
//        cell.item = item
//        
//        return cell
//    }
//    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let group = self.cellData[indexPath.section]
//        let item = group[indexPath.row]
//        
//        //判断item4
//        if let completion = item.operation {
//            completion()
//        }
//            
//        else if let VC = item.vcClass {
//            self.navigationController?.pushViewController((VC as! UIViewController.Type).init(), animated: true)
//        }
//    }

}
