//
//  ViewController.swift
//  应用管理
//
//  Created by Lei Zhao on 7/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

let kColumn = 3
let kRow = 4

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let yellowViewWidth = CGFloat(80)
        let yellowViewHeight = CGFloat(95)
        
        
        //计算间距
        let margin = CGFloat(self.view.frame.size.width - CGFloat(kColumn) * yellowViewWidth)/CGFloat(kColumn + 1)
        
        for j in 0..<kRow {
            for i in 0..<kColumn {
                let yellowViewX = margin * CGFloat(i+1) + CGFloat(i) * yellowViewWidth
                let yellowViewY = CGFloat(j + 1) * margin + CGFloat(j) * yellowViewHeight
                
                let yellowViewframe = CGRectMake(yellowViewX, yellowViewY, yellowViewWidth, yellowViewHeight)
                
                let yellowView = UIView(frame: yellowViewframe)
                
                yellowView.backgroundColor = UIColor.yellowColor()
                
                self.view.addSubview(yellowView)
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

