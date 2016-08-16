//
//  CZProductCell.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZProductCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product: CZProduct! {
        didSet {
            self.imageView.image = UIImage(named: self.product.icon)
            
            self.nameLabel.text = self.product.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imageView.layer.cornerRadius = 15
        self.imageView.layer.masksToBounds = true
    }

}
