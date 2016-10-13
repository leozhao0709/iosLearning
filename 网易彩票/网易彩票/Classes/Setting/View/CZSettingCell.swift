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
        mSwitch.addTarget(self, action: #selector(self.valueChanged), for: UIControlEvents.valueChanged)
        
        return mSwitch
    }()
    
    lazy var myLabel: UILabel? = {
        let label = UILabel()
        label.bounds = CGRect(x: 0, y: 0, width: 80, height: 44)
        label.text = "00:00"
        
        return label
    }()
    
    var item: CZSettingItem! {
        didSet {
            self.textLabel?.text = item.title
            
            if let icon = item.icon {
                self.imageView?.image = UIImage(named: icon)
            }
            
            self.detailTextLabel?.text = item.subtitle
            
            //        cell?.accessoryType = .DisclosureIndicator
            //        cell?.accessoryView = UIImageView(image: UIImage(named: "CellArrow"))
            
            if item .isKind(of: CZSettingArrowItem.self) {
                self.accessoryView = self.myArrow
                
                self.selectionStyle = .default
            }
            else if item.isKind(of: CZSettingSwitchItem.self){
                let switchView = mySwitch
                switchView!.isOn = UserDefaults.standard.bool(forKey: item.title)
                self.accessoryView = switchView
                
                self.selectionStyle = .none
            }
            else if item.isKind(of: CZSettingLabelItem.self) {
                
                
                self.accessoryView = self.myLabel
                
                self.selectionStyle = .default
            }
        }
    }

    static func cellWithTableView(_ tableView: UITableView)-> CZSettingCell {
        
        let cellIdentity = "SettingCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity) as? CZSettingCell
        
        if cell == nil {
            cell = CZSettingCell(style: .value1, reuseIdentifier: cellIdentity)
        }
        
        return cell!
        
    }
    
    @objc fileprivate func valueChanged(_ mySwitch: UISwitch) {
        let defaults = UserDefaults.standard
        defaults.set(mySwitch.isOn, forKey: self.item.title)
        defaults.synchronize()
    }

}
