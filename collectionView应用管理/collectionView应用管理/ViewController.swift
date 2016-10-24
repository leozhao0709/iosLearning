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
        let path = Bundle.main.path(forResource: "app.plist", ofType: nil)
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
        
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: identifier)
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AppCell
        
        let appModel = self.dataArray[(indexPath as NSIndexPath).item]
        cell.appModel = appModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("----\((indexPath as NSIndexPath).item)")
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }


}

