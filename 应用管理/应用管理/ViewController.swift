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

//定义imageview Y值
let kTopY: CGFloat = 5

//定义imageView的宽高
let imageViewWidth: CGFloat = 45;
let imageViewHeight: CGFloat = 45;

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let yellowViewWidth: CGFloat = 80
        let yellowViewHeight: CGFloat = 95
        
        
        //计算间距
        let margin: CGFloat = (self.view.frame.size.width - CGFloat(kColumn) * yellowViewWidth)/(CGFloat(kColumn) + 1)
        
        for j in 0..<kRow {
            for i in 0..<kColumn {
                //添加背景view
                let yellowViewX = margin * CGFloat(i+1) + CGFloat(i) * yellowViewWidth
                let yellowViewY = CGFloat(j + 1) * margin + CGFloat(j) * yellowViewHeight
                
                let yellowViewframe = CGRectMake(yellowViewX, yellowViewY, yellowViewWidth, yellowViewHeight)
                
                let yellowView = UIView(frame: yellowViewframe)
                
                yellowView.backgroundColor = UIColor.yellowColor()
                
                self.view.addSubview(yellowView)
                
                /**
                 添加imageView内的控件
                 */
                
                /**
                 1.添加imageView
                 */
                
                //宽高
                
                let imageViewX: CGFloat = (yellowViewWidth - imageViewWidth)/2
                let iconImageView = UIImageView(frame: CGRectMake(imageViewX, kTopY, imageViewWidth, imageViewHeight))
                
                iconImageView.backgroundColor = UIColor.redColor()
                
                yellowView.addSubview(iconImageView)
                
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

