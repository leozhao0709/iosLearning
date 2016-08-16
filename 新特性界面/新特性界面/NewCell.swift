//
//  NewCell.swift
//  新特性界面
//
//  Created by Lei Zhao on 7/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class NewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var indexLabel: UILabel!
    
    var iconImage: UIImage! {
        didSet {
            iconImageView.image = iconImage
        }
    }
    
    var indexPath: NSIndexPath! {
        didSet {
            indexLabel.textColor = UIColor.orangeColor()
            indexLabel.text = "\(indexPath.section)/\(indexPath.item)"
        }
    }
    
}
