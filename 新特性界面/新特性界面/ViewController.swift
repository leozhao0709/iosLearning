//
//  ViewController.swift
//  新特性界面
//
//  Created by Lei Zhao on 7/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    lazy var dataArray:[UIImage]! = {
        var imageArray:[UIImage] = []
        
        for i in 0..<9 {
            let imageName = String(format: "%d.jpg", i)
            
            let image = UIImage(named: imageName)
            
            imageArray.append(image!)
        }
        
        return imageArray
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.dataSource = self
        self.flowLayout.itemSize = self.view.bounds.size
        self.flowLayout.scrollDirection = .Horizontal
        self.flowLayout.minimumLineSpacing = 0
        
        
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView.pagingEnabled = true
        
//        self.collectionView.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("New", forIndexPath: indexPath) as! NewCell
        
//        cell.backgroundColor = UIColor.redColor()
        
        let image = self.dataArray[indexPath.item]
        
        cell.iconImage = image
        
        cell.indexPath = indexPath
        
        return cell
    }


}

