//
//  ViewController.swift
//  自定义布局（相册）
//
//  Created by Lei Zhao on 7/25/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    let identifier = "photoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let flowLayout = PhotoFlowLayout()
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 200, 375, 300), collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        
        collectionView.registerClass(PhotoCell.self, forCellWithReuseIdentifier: identifier)
        
        
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
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! PhotoCell
        
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }


}

