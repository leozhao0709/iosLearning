//
//  HeaderView.swift
//  QQ好友列表
//
//  Created by Lei Zhao on 7/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit


class HeaderView: UITableViewHeaderFooterView {
    
    private var headButton: UIButton!
    private var onlineLabel: UILabel!
    var delegate: HeaderViewDelegate?
    
    var rotateImageView:Bool! = false {
        didSet {
            if let rotate = rotateImageView {
                if rotate {
                    headButton.imageView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2))
                }
                else{
                     headButton.imageView?.transform = CGAffineTransformIdentity
                }
            }
        }
    }
    
    var groupModel: GroupsModel! {
        didSet{
            self.setupUI()
            
            self.headButton.setTitle(groupModel.name, forState: .Normal)
            
            self.onlineLabel.text = String(format: "%d/%d", groupModel.online, groupModel.friends.count)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(HeaderView:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //headButton
        self.headButton.frame = self.contentView.bounds
        
        //label
        let labelWidth: CGFloat = 120
        let labelHeight: CGFloat = 40
        let labelX = self.contentView.frame.width - labelWidth
        
        self.onlineLabel.frame = CGRectMake(labelX, 0, labelWidth, labelHeight)
    }
    
    private func setupUI() {
        let headButton = UIButton()
        
        self.headButton = headButton
        
        headButton.setBackgroundImage(UIImage(named: "buddy_header_bg"), forState: .Normal)
        headButton.setBackgroundImage(UIImage(named: "buddy_header_bg_highlighted"), forState: .Highlighted)
        
        headButton.setImage(UIImage(named: "buddy_header_arrow"), forState: .Normal)
        
        headButton.imageView?.contentMode = .Center
        headButton.imageView?.clipsToBounds = false
        
        headButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        headButton.contentHorizontalAlignment = .Left
        
        headButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        
        headButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0)
        
        headButton.addTarget(self, action: #selector(didClickButton), forControlEvents: .TouchUpInside)
        
        
        let onlineLable = UILabel()
        
        self.onlineLabel = onlineLable
        
        onlineLable.textAlignment = .Center
        
        headButton.addSubview(onlineLable)
        
        self.contentView.addSubview(headButton)
        
    }
    
    @objc private func didClickButton(button: UIButton) {
        
//        headButton.imageView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2))
        
        if let delegate = self.delegate {
            delegate.HeaderViewDidClickButton(self, button: button)
        }
    }

}
