//
//  AppCell.swift
//  collectionView应用管理
//
//  Created by Lei Zhao on 7/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    var iconImageView: UIImageView?
    var nameLabel: UILabel?
    
    var appModel: AppModel? {
        didSet {
            
            self.iconImageView?.image = UIImage(named: (appModel?.icon)!)
            
            self.nameLabel?.text = appModel!.name
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(AppCell:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.redColor()
        
        let cellSize = self.contentView.frame.size
        let iconWidth = cellSize.width * 0.6
        let iconX = (cellSize.width - iconWidth) / 2
        
        let iconImageView = UIImageView(frame: CGRectMake(iconX, 0, iconWidth, iconWidth))
        
        self.iconImageView = iconImageView
        
        self.contentView.addSubview(self.iconImageView!)
        
        let nameLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(iconImageView.frame), cellSize.width, 20))
        nameLabel.font = UIFont.systemFontOfSize(13)
        nameLabel.textAlignment = .Center
        nameLabel.textColor = UIColor.blackColor()
        
//        nameLabel.text = "爸爸去哪"
        
        self.nameLabel = nameLabel
        self.contentView.addSubview(self.nameLabel!)
        
    }
    

}
