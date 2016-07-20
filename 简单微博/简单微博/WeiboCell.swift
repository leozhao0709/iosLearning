//
//  WeiboCell.swift
//  简单微博
//
//  Created by Lei Zhao on 7/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WeiboCell: UITableViewCell {
    
    private var userImageView: UIImageView!
    private var nameLabel: UILabel!
    private var vipImageView: UIImageView?
    private var contentLabel: UILabel?
    private var pictureImageView: UIImageView?
    
    var weiboModel: WeiboModel?
        
        {
        didSet {
            
            self.userImageView?.image = UIImage(named: (weiboModel!.icon)!)
            self.nameLabel?.text = weiboModel!.name
            
            self.vipImageView?.image = UIImage(named: "vip")
            
            self.contentLabel?.text = weiboModel!.text
            
            if let picture = weiboModel!.picture {
                self.pictureImageView?.image = UIImage(named: picture)
            }
            
            
            //头像frame
            let margin:CGFloat = 10
            let userImageWidth:CGFloat = 50
            
            self.userImageView?.frame = CGRectMake(margin, margin, userImageWidth, userImageWidth)
            
            //用户名称frame
            let nameLabelX = CGRectGetMaxX(self.userImageView.frame) + margin
            
            let nameLabelHeight: CGFloat = 20
//            let nameLabelWidth: CGFloat = 150
            
            let nameLabelY = (userImageWidth - nameLabelHeight)/2 + margin
            
            let nameLabelMaxSize = CGSizeMake(CGFloat.max, CGFloat.max)
            
            let nameLabelRealSize = ((self.weiboModel?.name)! as NSString).boundingRectWithSize(nameLabelMaxSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(17)], context: nil)
            
            self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelRealSize.width, nameLabelRealSize.height)
            
            //vip
            let vipWidth: CGFloat = 20
            let vipX: CGFloat = CGRectGetMaxX(self.nameLabel.frame) + margin
            let vipY: CGFloat = CGRectGetMinY(self.nameLabel.frame)
            
            if self.weiboModel!.vip == 1 {
                self.vipImageView!.frame = CGRectMake(vipX, vipY, vipWidth, vipWidth)
            }
            
            //contentLabel
            let contentLabelWidth = self.contentView.frame.width - 2 * margin
            
//            let contentMaxSize = CGSizeMake(contentLabelWidth, CGFloat.max)
//            
//            let attributesDict = [NSFontAttributeName: UIFont.systemFontOfSize(15)]
            
//            let contentRealSize = (weiboModel!.text as NSString).boundingRectWithSize(contentMaxSize, options: .UsesLineFragmentOrigin, attributes: attributesDict, context: nil)
            
            let contentLabelX = margin
            let contentLabelY = CGRectGetMaxY(self.userImageView.frame) + margin
            
//            self.contentLabel?.frame = CGRectMake(contentLabelX, contentLabelY, contentRealSize.width, contentRealSize.height)
            self.contentLabel?.frame = CGRectMake(contentLabelX, contentLabelY, contentLabelWidth, 0)
            self.contentLabel?.sizeToFit()
            
            //picture
            let pictureWidth = 2 * userImageWidth
            let pictureX = margin
            let pictureY = CGRectGetMaxY(self.contentLabel!.frame) + margin
            
            self.pictureImageView?.frame = CGRectMake(pictureX, pictureY, pictureWidth, pictureWidth)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(WeiboCell:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    private func setupUI() {
        
        self.userImageView = UIImageView()
        self.contentView.addSubview(self.userImageView!)
        
        self.nameLabel = UILabel()
        self.nameLabel.textColor = UIColor.redColor()
        self.contentView.addSubview(nameLabel!)
        
        self.vipImageView = UIImageView()
        self.contentView.addSubview(self.vipImageView!)
        
        self.contentLabel = UILabel()
        self.contentLabel?.numberOfLines = 0
        self.contentLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.contentLabel!)
        
        self.pictureImageView = UIImageView()
        self.contentView.addSubview(self.pictureImageView!)
    }
    

}
