//
//  ViewController.swift
//  QQ聊天界面
//
//  Created by Lei Zhao on 7/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataArray: [QQModel] = {
        let path = NSBundle.mainBundle().pathForResource("messages.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var QQModelArray: [QQModel] = []
        
        for dict in tempArray! {
//            let model = QQModel(dict: dict as! NSDictionary)
            let model = QQModel(dict: dict as! [String : AnyObject] )
            
            QQModelArray.append(model)
        }
        
        return QQModelArray
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        let identifter = "QQ"
//
//        var cell = tableView.dequeueReusableCellWithIdentifier(identifter) as? QQCell
//        
//        if cell == nil {
//            cell = QQCell(style: .Default, reuseIdentifier: identifter)
//        }
        
        let cell = QQCell(style: .Default, reuseIdentifier: identifter)
        
        cell.qqModel = self.dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let qqModel = self.dataArray[indexPath.row]
        return qqModel.height
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

