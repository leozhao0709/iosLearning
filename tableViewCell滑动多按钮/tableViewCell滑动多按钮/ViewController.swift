//
//  ViewController.swift
//  tableViewCell滑动多按钮
//
//  Created by Lei Zhao on 9/3/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        cell?.textLabel?.text = String(format: "row-----%d", indexPath.row)
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        NSLog("row \(indexPath.row) is deleting")
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let action1 = UITableViewRowAction(style: .Default, title: "删除") { (rowaction: UITableViewRowAction, indexPath: NSIndexPath) in
            NSLog("\(rowaction.title!) is doing now")
        }
        
        let action2 = UITableViewRowAction(style: .Normal, title: "修改") { (rowaction: UITableViewRowAction, indexPath: NSIndexPath) in
            NSLog("\(rowaction.title!) is doing now")
        }
        
        action2.backgroundColor = UIColor.orangeColor()
        
        return [action1, action2]
    }
    
}

