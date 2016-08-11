//
//  CZSettingCell.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/10/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZSettingCell: UITableViewCell {
    
    var item: CZSettingItem! {
        didSet {
            self.textLabel?.text = item.title
            self.imageView?.image = UIImage(named: item.icon)
            
            //        cell?.accessoryType = .DisclosureIndicator
            //        cell?.accessoryView = UIImageView(image: UIImage(named: "CellArrow"))
            
            if item .isKindOfClass(CZSettingArrowItem) {
                self.accessoryView = UIImageView(image: UIImage(named: "CellArrow"))
            } else{
                let switchView = UISwitch()
                switchView.on = true
                self.accessoryView = switchView
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

}
