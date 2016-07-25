//
//  ViewController.swift
//  collectionView应用管理
//
//  Created by Lei Zhao on 7/24/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier = "collectionCell"
    
    lazy var dataArray: [AppModel]! = {
        let path = NSBundle.mainBundle().pathForResource("app.plist", ofType: nil)
        let tempArray = NSArray(contentsOfFile: path!)
        
        var appModelArray:[AppModel] = []
        
        for dict in tempArray! {
            let appModel = AppModel(dict: dict as! [String : AnyObject])
            
            appModelArray.append(appModel)
        }
        
        return appModelArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSizeMake(100, 100)
        
        flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        collectionView.registerClass(AppCell.self, forCellWithReuseIdentifier: identifier)
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = UIColor.whiteColor()
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AppCell
        
        let appModel = self.dataArray[indexPath.item]
        cell.appModel = appModel
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("----\(indexPath.item)")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

