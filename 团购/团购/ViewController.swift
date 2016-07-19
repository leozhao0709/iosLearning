//
//  ViewController.swift
//  团购
//
//  Created by Lei Zhao on 7/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, FooterViewDelegate {
    
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
    
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: self.view.bounds)
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        tableView.rowHeight = 90
        
        let bannerView = BannerView(frame: CGRectMake(0, 0, 375, 200))
        
        let imageArray = ["ad_00", "ad_01", "ad_02", "ad_03", "ad_04"]
        
        bannerView.imageArray = imageArray
        
//        bannerView.backgroundColor = UIColor.yellowColor()
        
        tableView.tableHeaderView = bannerView
        
        //set footer view
        
//        let footView = UIView(frame: CGRectMake(0, 0, 375, 44))
//        
//        footView.backgroundColor = UIColor.orangeColor()
//        
//        let button = UIButton(frame: CGRectMake(5, 5, 365, 34))
//        button.backgroundColor = UIColor.redColor()
//        
//        footView.addSubview(button)
//        
//        tableView.tableFooterView = footView
        
        let footerView = NSBundle.mainBundle().loadNibNamed("FooterView", owner: nil, options: nil).last as? FooterView
        
        footerView?.delegate = self
        
        tableView.tableFooterView = footerView
    }
    
    func footerView(footerView: FooterView) {
        footerView.showLoadView(true)
        
//        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(self.loadMoreData(_:)), userInfo: footerView, repeats: false)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            footerView.showLoadView(false)
            
            let model = GrouponsModel(icon: "9b437cdfb3e3b542b5917ce2e9a74890", title: "江边一枝花", price: "98")
            
            self.dataArray.append(model)
            
            let indexPath = NSIndexPath(forRow: self.dataArray.count - 1, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            
            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
        }
    }
    
//    func loadMoreData(timer: NSTimer){
//        let footerView = timer.userInfo
//        footerView!.showLoadView(false)
//        
//        let model = GrouponsModel(icon: "9b437cdfb3e3b542b5917ce2e9a74890", title: "江边一枝花", price: "98")
//        
//        self.dataArray.append(model)
//        
//        let indexPath = NSIndexPath(forRow: self.dataArray.count - 1, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
//        
//        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
//        
//    }

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

