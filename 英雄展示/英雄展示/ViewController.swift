//
//  ViewController.swift
//  英雄展示
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataArray: [HeroModel] = {
        let path = NSBundle.mainBundle().pathForResource("heros.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var heroArray:[HeroModel] = []
        
        for dict in tempArray! {
            
            let model = HeroModel(dict: dict as! NSDictionary)
            heroArray.append(model)
        }
        
        return heroArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        
//        tableView.editing = true
    
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
        
        let identifier = "heroCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle , reuseIdentifier: identifier)
        }
        
        let heroModel = self.dataArray[indexPath.row]
        
        cell?.imageView?.image = nil
        
        if let name = heroModel.icon {
            cell!.imageView?.image = UIImage(named: name)
        }
     
        cell!.textLabel?.text = heroModel.name!
        
        cell!.detailTextLabel?.text = heroModel.intro
        
        cell!.accessoryType = .DisclosureIndicator
        
//        NSLog("-------\(unsafeAddressOf(cell!))")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            self.dataArray.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        else if(editingStyle == .Insert)
        {
            let model = HeroModel(name: "黔愚")
            
            self.dataArray.insert(model, atIndex: indexPath.row)
            
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "卡擦掉"
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return .Delete
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

