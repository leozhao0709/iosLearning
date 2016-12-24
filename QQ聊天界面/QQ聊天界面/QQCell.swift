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
            self.timeLabel.hidden = qqModel.hideTimeLabel
            
            self.contentView.addSubview(self.timeLabel)
            
            
            // user image
            self.userImageView = UIImageView(frame: qqModel.iconFrame)
            if qqModel.type == .Me
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
            
//            self.contentButton.backgroundColor = UIColor.orangeColor()
            
            if qqModel.type == .Me  {
                
//                let resizeImage = self.resizeImageWith(imageName: "chat_send_nor")
                
                let resizeImage = UIImage(named: "chat_send_nor")
                
                self.contentButton.setBackgroundImage(resizeImage, forState: .Normal)
            }
            else{
                
                let resizeImage = self.resizeImageWith(imageName: "chat_recive_press_pic")
                
                self.contentButton.setBackgroundImage(resizeImage, forState: .Normal)
            }
            
            //set content edge to make text in the image
            
            self.contentButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
            
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
    
    private func resizeImageWith(imageName imageName: String) -> UIImage {
        let image = UIImage(named: imageName)
        
        let halfWidth = image!.size.width/2
        let halfHeight = image!.size.height/2
        
        let resizeImage = image?.resizableImageWithCapInsets(UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth), resizingMode: .Stretch)
        
        return resizeImage!
    }

}
