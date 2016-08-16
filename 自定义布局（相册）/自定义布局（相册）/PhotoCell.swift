//
//  PhotoCell.swift
//  自定义布局（相册）
//
//  Created by Lei Zhao on 7/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let iconImageView = UIImageView(frame: self.contentView.bounds)
        
        iconImageView.image = UIImage(named: "zilong")
        
        self.contentView.addSubview(iconImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(PhotoCell:) has not been implemented")
    }
    
}
