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
    
    var contentFrameModel: ContentFrameModel?
        
        {
        didSet {
            
            self.setupData()
            
            self.setupFrame()
            
            
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
        self.contentView.addSubview(self.nameLabel!)
        
        self.vipImageView = UIImageView()
        self.contentView.addSubview(self.vipImageView!)
        
        self.contentLabel = UILabel()
        self.contentLabel?.numberOfLines = 0
        self.contentLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.contentLabel!)
        
        self.pictureImageView = UIImageView()
        self.contentView.addSubview(self.pictureImageView!)
    }
    
    private func setupData() {
        self.vipImageView?.image = nil
        self.pictureImageView?.image = nil
        
        let weiboModel = contentFrameModel?.weiboModel
        
        self.userImageView?.image = UIImage(named: (weiboModel!.icon)!)
        self.nameLabel?.text = weiboModel!.name
        
        if weiboModel!.vip == 1 {
            self.vipImageView?.image = UIImage(named: "vip")
            self.nameLabel.textColor = UIColor.redColor()
        }
        else{
            self.nameLabel.textColor = UIColor.blackColor()
        }
        
        
        self.contentLabel?.text = weiboModel!.text
        
        if let picture = weiboModel!.picture {
            self.pictureImageView?.image = UIImage(named: picture)
        }
    }
    
    private func setupFrame() {
        self.userImageView.frame = (self.contentFrameModel?.userImageFrame)!
        
        
        self.nameLabel.frame = (self.contentFrameModel?.userNameFrame)!
        
        self.vipImageView?.frame = (self.contentFrameModel?.vipImageFrame)!
        
        self.contentLabel?.frame = (self.contentFrameModel?.contentFrame)!
        
        self.pictureImageView?.frame = (self.contentFrameModel?.pictureFrame)!
    }
    

}
