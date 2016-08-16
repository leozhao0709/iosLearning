//
//  CZHelpViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SwiftyJSON

class CZHelpViewController: CZBaseSettingViewController {

    lazy var htmls: [CZHtmlPage] = {
        
        let path = NSBundle.mainBundle().pathForResource("help.json", ofType: nil)
        
        let data = NSData(contentsOfFile: path!)
        
        var tempArray:[CZHtmlPage] = []
        
        do {
            let helpArr = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions([])) as! NSArray
            
            for dict in helpArr {
                let htmlPage = CZHtmlPage(dict: dict as! [String : String])
                
                tempArray.append(htmlPage)
            }
            
        }
        catch {
            
        }
        
        return tempArray
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let group = CZSettingGroup()
        
        var items:[CZSettingArrowItem] = []
        for htmlPage in self.htmls {
            let item = CZSettingArrowItem(icon: nil, title: htmlPage.title)
            items.append(item)
        }
//        NSLog("\(items)")
        group.items = items
        
        self.cellData.append(group)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let webVc = CZWebViewController()
        webVc.htmlPage = self.htmls[indexPath.row]
        
        let nav = UINavigationController(rootViewController: webVc)
        
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
}
