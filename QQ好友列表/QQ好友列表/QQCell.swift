//
//  QQCell.swift
//  QQ好友列表
//
//  Created by Lei Zhao on 7/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class QQCell: UITableViewCell {
    
    var friendsModel: FriendsModel! {
        didSet {
            
            self.imageView?.image = UIImage(named: friendsModel.icon!)
            
            self.textLabel?.text = friendsModel.name!
            
            self.detailTextLabel?.text = friendsModel.intro!
            
            if friendsModel.vip == 1 {
                self.textLabel?.textColor = UIColor.redColor()
            }
            else{
                self.textLabel?.textColor = UIColor.blackColor()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let lineViewHeight: CGFloat = 0.5
        let lineViewY:CGFloat = 44 - lineViewHeight
        let lineView = UIView(frame: CGRectMake(0, lineViewY, 375, lineViewHeight))
        
        lineView.backgroundColor = UIColor.lightGrayColor()
        
        self.contentView.addSubview(lineView)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
