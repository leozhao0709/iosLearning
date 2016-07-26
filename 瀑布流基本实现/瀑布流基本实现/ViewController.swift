//
//  ViewController.swift
//  瀑布流基本实现
//
//  Created by Lei Zhao on 7/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    let identifier = "shopCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let flowLayout = WaterFlowLayout()
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ShopCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! ShopCell
        
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }


}

