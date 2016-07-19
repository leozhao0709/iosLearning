//
//  ViewController.swift
//  团购
//
//  Created by Lei Zhao on 7/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    lazy var dataArray:[GrouponsModel] = {
        let path = NSBundle.mainBundle().pathForResource("tgs.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var grouponsArray: [GrouponsModel] = []
        
        for dict in tempArray! {
            let model = GrouponsModel(dict: dict as! NSDictionary)
            grouponsArray.append(model)
        }
        
        return grouponsArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: self.view.bounds)
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        tableView.rowHeight = 90
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "groupons"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .Subtitle, reuseIdentifier: identifier)
        }
        
        let model = self.dataArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: model.icon!)
        
        cell?.textLabel?.text = model.title
        
        cell?.detailTextLabel?.text = String(format: "$\(model.price!)")
        
        return cell!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

