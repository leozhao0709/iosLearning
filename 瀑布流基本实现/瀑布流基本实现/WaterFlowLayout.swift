//
//  WaterFlowLayout.swift
//  瀑布流基本实现
//
//  Created by Lei Zhao on 7/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WaterFlowLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let maxColumn: CGFloat = 3
        
        let columnMargin: CGFloat = 10
        let rowMargin: CGFloat = 10
        
        let sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        let collectionViewSize = self.collectionView?.frame.size
        
        let itemWidth = ((collectionViewSize?.width)! - sectionInset.left - sectionInset.right - (maxColumn - 1) * columnMargin) / maxColumn
        
        let itemHeight: CGFloat = CGFloat(arc4random_uniform(100)) + 100
        
        let itemX: CGFloat = CGFloat(arc4random_uniform(100)) + 100
        
        let itemY: CGFloat = CGFloat(arc4random_uniform(200)) + 100
        
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight)
        
        return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var itemArray:[UICollectionViewLayoutAttributes] = []
        
        let itemCount = self.collectionView?.numberOfItemsInSection(0)
        
        for i in 0 ..< itemCount! {
            
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attri = self.layoutAttributesForItemAtIndexPath(indexPath)
            
            itemArray.append(attri!)
        }
        
        return itemArray
    }
}
