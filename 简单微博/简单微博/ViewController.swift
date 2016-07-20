//
//  ViewController.swift
//  简单微博
//
//  Created by Lei Zhao on 7/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private lazy var dataArray: [WeiboModel] = {
        let path = NSBundle.mainBundle().pathForResource("weibo.plist", ofType: nil)
        let tempArray = NSArray(contentsOfFile: path!)
        
        var weiboArray: [WeiboModel] = []
        
        for dict in tempArray! {
            let model = WeiboModel(dict: dict as! NSDictionary)
            weiboArray.append(model)
        }
        return weiboArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = 500
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "weiboCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? WeiboCell
        
        if cell == nil {
            cell = WeiboCell(style: .Default, reuseIdentifier: identifier)
        }
        
        let weiboModel = self.dataArray[indexPath.row]
        
        cell!.weiboModel = weiboModel
        
        return cell!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

