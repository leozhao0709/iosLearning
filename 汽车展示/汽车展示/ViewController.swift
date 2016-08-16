//
//  ViewController.swift
//  汽车展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var dataArray:[CarModel] {
        
        let path = NSBundle.mainBundle().pathForResource("cars_simple.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var carArray = [CarModel]()
        
        for dict in tempArray! {
            let model = CarModel(dict: dict as! NSDictionary)
            
            carArray.append(model)
        }
        
        return carArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray[section].cars!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.dataArray[indexPath.section].cars![indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataArray[section].title
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.dataArray[section].desc
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

