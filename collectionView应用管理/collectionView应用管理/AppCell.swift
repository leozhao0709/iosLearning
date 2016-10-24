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
        
        let iconImageView = UIImageView(frame: CGRect(x: iconX, y: 0, width: iconWidth, height: iconWidth))
        
        self.iconImageView = iconImageView
        
        self.contentView.addSubview(self.iconImageView!)
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: cellSize.width, height: 20))
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.black
        
//        nameLabel.text = "爸爸去哪"
        
        self.nameLabel = nameLabel
        self.contentView.addSubview(self.nameLabel!)
        
    }
    

}
