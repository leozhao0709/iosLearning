//
//  WBHomeMenuView.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBHomeMenuView: UIView {

    weak var backgroundImageView: UIImageView?
    weak var contentView: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    
    /**
     Just add UI, No frame need here
     */
    func setupUI() {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "popover_background")
        self.backgroundImageView = imageView
        
        self.addSubview(imageView)
        
        let tableView = UITableView()
        self.contentView = tableView
        
        self.addSubview(tableView)
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xMargin: CGFloat = 15
        let yMargin: CGFloat = 18
        self.contentView?.frame = CGRect(x: xMargin, y: yMargin, width: 150, height: 200)
        
        self.frame = CGRect(x: 0, y: 0, width: (self.contentView?.frame.maxX)! + xMargin, height: (self.contentView?.frame.maxY)! + yMargin)
        
        self.backgroundImageView?.frame = self.frame
        
    }


}
