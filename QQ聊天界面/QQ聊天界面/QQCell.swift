//
//  QQCell.swift
//  QQ聊天界面
//
//  Created by Lei Zhao on 7/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class QQCell: UITableViewCell {
    
    var timeLabel: UILabel!
    var userImageView: UIImageView!
    var contentButton: UIButton!
    
    var qqModel: QQModel! {
        didSet {

            for view in self.contentView.subviews {
                view.removeFromSuperview()
            }
            
            //time label
            self.timeLabel = UILabel(frame: qqModel.timeLabelFrame)
            self.timeLabel.text = qqModel.time
            self.timeLabel.textAlignment = .Center
            
            self.contentView.addSubview(self.timeLabel)
            
            
            // user image
            self.userImageView = UIImageView(frame: qqModel.iconFrame)
            if qqModel.type == 1
            {
                self.userImageView.image = UIImage(named: "me")
            }
            else
            {
                self.userImageView.image = UIImage(named: "other")
            }
            
            self.contentView.addSubview(self.userImageView)
            
            
            //content button
            self.contentButton = UIButton(frame: qqModel.textFrame)
            self.contentButton.setTitle(qqModel.text, forState: .Normal)
            self.contentButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.contentButton.titleLabel?.numberOfLines = 0
            self.contentButton.titleLabel?.font = UIFont.systemFontOfSize(17)
            
            self.contentButton.backgroundColor = UIColor.orangeColor()
            
            if qqModel.type == 1 {
                self.contentButton.setBackgroundImage(UIImage(named: "chat_send_nor"), forState: .Normal)
            }
            else{
                self.contentButton.setBackgroundImage(UIImage(named: "chat_recive_press_pic"), forState: .Normal)
            }
            
            self.contentView.addSubview(self.contentButton)
            
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
