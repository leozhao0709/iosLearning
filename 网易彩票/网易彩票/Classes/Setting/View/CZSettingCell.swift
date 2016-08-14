//
//  CZSettingCell.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/10/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZSettingCell: UITableViewCell {
    
    lazy var myArrow:UIImageView? = {
        return UIImageView(image: UIImage(named: "CellArrow"))
    }()
    
    lazy var mySwitch: UISwitch? = {
        let mSwitch = UISwitch()
        mSwitch.addTarget(self, action: #selector(self.valueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
        return mSwitch
    }()
    
    lazy var myLabel: UILabel? = {
        let label = UILabel()
        label.bounds = CGRectMake(0, 0, 80, 44)
        label.text = "00:00"
        
        return label
    }()
    
    var item: CZSettingItem! {
        didSet {
            self.textLabel?.text = item.title
            
            if let icon = item.icon {
                self.imageView?.image = UIImage(named: icon)
            }
            
            
            //        cell?.accessoryType = .DisclosureIndicator
            //        cell?.accessoryView = UIImageView(image: UIImage(named: "CellArrow"))
            
            if item .isKindOfClass(CZSettingArrowItem) {
                self.accessoryView = self.myArrow
                
                self.selectionStyle = .Default
            }
            else if item.isKindOfClass(CZSettingSwitchItem){
                let switchView = mySwitch
                switchView!.on = NSUserDefaults.standardUserDefaults().boolForKey(item.title)
                self.accessoryView = switchView
                
                self.selectionStyle = .None
            }
            else if item.isKindOfClass(CZSettingLabelItem) {
                
                
                self.accessoryView = self.myLabel
                
                self.selectionStyle = .Default
            }
        }
    }

    static func cellWithTableView(tableView: UITableView)-> CZSettingCell {
        
        let cellIdentity = "SettingCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentity) as? CZSettingCell
        
        if cell == nil {
            cell = CZSettingCell(style: .Default, reuseIdentifier: cellIdentity)
        }
        
        return cell!
        
    }
    
    @objc private func valueChanged(mySwitch: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(mySwitch.on, forKey: self.item.title)
        defaults.synchronize()
    }

}
