//
//  CZProductsShareViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CZProductsShareViewController: UICollectionViewController {

    lazy var products:[CZProduct]! = {
        let path = Bundle.main.path(forResource: "products.json", ofType: nil)
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        
        var tempArray:[CZProduct] = []
        
        do {
            let producsArr = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions([])) as! NSArray
            
            for dict in producsArr {
                let product = CZProduct(dict: dict as! [String : String])
                
                tempArray.append(product)
            }
            
        }
        catch {
            
        }
        
        return tempArray
    }()
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
        
        flowLayout.itemSize = CGSize(width: 60, height: 80)
        
        flowLayout.minimumLineSpacing = 25
//        flowLayout.minimumInteritemSpacing = 10
        
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(CZProductCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.register(UINib(nibName: "CZProductCell", bundle: nil) , forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CZProductCell

    
        // Configure the cell
        cell.product = self.products[(indexPath as NSIndexPath).row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
