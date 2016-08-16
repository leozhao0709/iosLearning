//
//  ContentFrameModel.swift
//  简单微博
//
//  Created by Lei Zhao on 7/19/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ContentFrameModel: NSObject {
    
    private(set) var userImageFrame: CGRect!
    
    var userNameFrame: CGRect!
    
    var vipImageFrame: CGRect?
    
    var contentFrame: CGRect?
    
    var pictureFrame: CGRect?
    
    var cellHeight: CGFloat?
    
    var weiboModel: WeiboModel? {
        didSet {
            
            //头像frame
            let margin:CGFloat = 10
            let userImageWidth:CGFloat = 50
            
            self.userImageFrame = CGRectMake(margin, margin, userImageWidth, userImageWidth)
            
            //用户名称frame
            let nameLabelX = CGRectGetMaxX(userImageFrame!) + margin
            
            let nameLabelHeight: CGFloat = 20
            
            let nameLabelMaxWidth = UIScreen.mainScreen().bounds.width - 2 * margin
            
            let nameLabelY = (userImageWidth - nameLabelHeight)/2 + margin
            
            let nameLabel = UILabel(frame: CGRectMake(nameLabelX, nameLabelY, nameLabelMaxWidth, 0))
            nameLabel.text = weiboModel?.name
            nameLabel.numberOfLines = 0
            nameLabel.sizeToFit()
            
            self.userNameFrame = nameLabel.frame
            
            
            //vip
            let vipWidth: CGFloat = 20
            let vipX: CGFloat = CGRectGetMaxX(self.userNameFrame) + margin
            let vipY: CGFloat = CGRectGetMinY(self.userNameFrame)
            
            if weiboModel!.vip == 1 {
                self.vipImageFrame = CGRectMake(vipX, vipY, vipWidth, vipWidth)
            }
            else {
                self.vipImageFrame = CGRectZero
            }
            
            //contentLabel
            let contentLabelMaxWidth = UIScreen.mainScreen().bounds.width - 2 * margin
            
            
            let contentLabelX = margin
            let contentLabelY = CGRectGetMaxY(self.userImageFrame) + margin
            
//            let label = UILabel(frame: CGRectMake(contentLabelX, contentLabelY, contentLabelMaxWidth, 0))
//            label.text = weiboModel?.text
//            label.numberOfLines = 0
//            nameLabel.font = UIFont.systemFontOfSize(15)
//            label.sizeToFit()
//            self.contentFrame = label.frame
            
            let contentMaxSize = CGSizeMake(contentLabelMaxWidth, 0)

            let attributesDict = [NSFontAttributeName: UIFont.systemFontOfSize(15)]

            let contentRealSize = (weiboModel!.text! as NSString).boundingRectWithSize(contentMaxSize, options: .UsesLineFragmentOrigin, attributes: attributesDict, context: nil)
            
            self.contentFrame = CGRectMake(contentLabelX, contentLabelY, contentRealSize.width, contentRealSize.height)
            
            
            //picture
            let pictureWidth = 2 * userImageWidth
            let pictureX = margin
            let pictureY = CGRectGetMaxY(self.contentFrame!) + margin
            
            if weiboModel!.picture != nil {
                self.pictureFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureWidth)
                
                //cell height
                
                self.cellHeight = CGRectGetMaxY(self.pictureFrame!) + margin
            }
            else
            {
                self.pictureFrame = CGRectZero
                
                self.cellHeight = CGRectGetMaxY(self.contentFrame!) + margin
            }
        }
    }
}
