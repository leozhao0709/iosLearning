//
//  ViewController.swift
//  不同的汽车展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var indexArray:[String]?
    
    private var dataArray:[CarModel] {
        let path = NSBundle.mainBundle().pathForResource("cars_total.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var carModelArray:[CarModel] = []
        
        for dict in tempArray! {
            let carModel = CarModel(dict: dict as! NSDictionary)
            carModelArray.append(carModel)
        }
        
        self.indexArray = (carModelArray as NSArray).valueForKeyPath("title") as? [String]
        
        return carModelArray
        
        
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
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray[section].cars?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let resueCellIdentifier = "settingCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(resueCellIdentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: resueCellIdentifier)
        }
        
        let carModel = self.dataArray[indexPath.section]
        
        let innerCarModel:InnerCarModel = carModel.cars![indexPath.row] as! InnerCarModel
        
        
        cell?.imageView?.image = UIImage(named: innerCarModel.icon!)
        
        cell?.textLabel?.text = innerCarModel.name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataArray[section].title
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.indexArray
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

