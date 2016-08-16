//
//  PhotoFlowLayout.swift
//  自定义布局（相册）
//
//  Created by Lei Zhao on 7/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class PhotoFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        self.scrollDirection = .Horizontal
        
        let collectionViewSize = self.collectionView?.frame.size
        
        let itemWidth = (collectionViewSize?.height)! * 0.6
        let itemHeight = (collectionViewSize?.height)! * 0.8
        
        self.itemSize = CGSizeMake(itemWidth, itemHeight)
        
        let margin = (collectionViewSize?.width)!/2 - itemWidth/2
        
        self.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
        
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: 0, inSection: 0))
//        
//        attributes.size = CGSizeMake(100, 100)
        
//        return [attributes]
        
        let superAttributes = super.layoutAttributesForElementsInRect(rect)
        
        //计算出屏幕的中心点， 中心点必须加上collectionView的偏移量.x
        let screenCenter = (self.collectionView?.contentOffset.x)! + (self.collectionView?.frame.size.width)!/2
        
        for itemAttributes in superAttributes! {
            let deltaMargin = abs(screenCenter - itemAttributes.center.x)
            
            let scaleDelta = 1.1 - deltaMargin / ((self.collectionView?.frame.size.width)!/2 + itemAttributes.size.width)
            
            itemAttributes.transform = CGAffineTransformMakeScale(scaleDelta, scaleDelta)
        }
        
        return superAttributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    /**
     - parameter proposedContentOffset: 本应该停留的位置
     - parameter velocity:              力度，速度
     
     - returns: targetContentOffset: 最终停留的位置(进行干预后停留的位置)
     */
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        //1.取出屏幕的中心点
        let screenCenter = proposedContentOffset.x + (self.collectionView?.frame.width)!/2
        
        //2. 取出可见范围内的cell
        var visibleRect = CGRectZero
        visibleRect.size = (self.collectionView?.frame.size)!
        visibleRect.origin = proposedContentOffset
        
        //用super避免重复调用计算比率
        let visibleArray = super.layoutAttributesForElementsInRect(visibleRect)
        
        var minMargin = CGFloat.max
        for attributes in visibleArray! {
            let deltaMargin = (attributes.center.x - screenCenter)
            
            if abs(minMargin) > abs(deltaMargin) {
                minMargin = deltaMargin
            }
        }
        
        return CGPointMake(proposedContentOffset.x + minMargin, proposedContentOffset.y)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(PhotoFlowLayout:) has not been implemented")
    }

}
