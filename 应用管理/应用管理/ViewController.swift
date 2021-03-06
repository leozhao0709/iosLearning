//
//  ViewController.swift
//  应用管理
//
//  Created by Lei Zhao on 7/15/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

let kColumn = 3

//定义imageview Y值
let kTopY: CGFloat = 5

//定义imageView的宽高
let imageViewWidth: CGFloat = 45;
let imageViewHeight: CGFloat = 45;

class ViewController: UIViewController {
    
    var dataArray: NSArray {
        let path = NSBundle.mainBundle().pathForResource("app.plist", ofType: nil)
            
        return NSArray(contentsOfFile: path!)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let yellowViewWidth: CGFloat = 80
        let yellowViewHeight: CGFloat = 95

        //计算间距
        let margin: CGFloat = (self.view.frame.size.width - CGFloat(kColumn) * yellowViewWidth)/(CGFloat(kColumn) + 1)
        
        for i in 0..<self.dataArray.count {
            
            let rowIndex = i/kColumn
            let columnIndex = i%kColumn
            
            //添加背景view
            let yellowViewX = margin * CGFloat(columnIndex+1) + CGFloat(columnIndex) * yellowViewWidth
            let yellowViewY = CGFloat(rowIndex + 1) * margin + CGFloat(rowIndex) * yellowViewHeight
            
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
            
            //取出数组中对应的字典
            let dict = self.dataArray[i] as! [String: AnyObject]
            print(dict)
            
            //宽高
            
            let imageViewX: CGFloat = (yellowViewWidth - imageViewWidth)/2
            let iconImageView = UIImageView(frame: CGRectMake(imageViewX, kTopY, imageViewWidth, imageViewHeight))
            
//                iconImageView.backgroundColor = UIColor.redColor()
            
            iconImageView.image = UIImage(named: (dict["icon"] as? String)!)
            
            yellowView.addSubview(iconImageView)
            
            /**
             label
             */
            let labelY = CGRectGetMaxY(iconImageView.frame) + kTopY/2
            let nameLabel = UILabel(frame: CGRectMake(0, labelY, yellowViewWidth, 15) )
            
            nameLabel.text = dict["name"] as? String
            
            nameLabel.textAlignment = NSTextAlignment.Center
            
            /**
             设置字体
             public class func systemFontOfSize(fontSize: CGFloat) -> UIFont
             public class func boldSystemFontOfSize(fontSize: CGFloat) -> UIFont
             public class func italicSystemFontOfSize(fontSize: CGFloat) -> UIFont
             */
            nameLabel.font = UIFont.italicSystemFontOfSize(CGFloat(15))
            
            yellowView.addSubview(nameLabel)
            
            
            /**
             button
             */
            let buttonWidth: CGFloat = imageViewWidth + 10
            let buttonHeight: CGFloat = 20
            let buttonX: CGFloat = (yellowViewWidth - buttonWidth)/2
            let buttonY: CGFloat = CGRectGetMaxY(nameLabel.frame) + kTopY/2
            
            let downloadButton = UIButton(frame: CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight))
            
            /**
             设置button属性
             设置background image, image, title 一定要分状态设置
             
             默认
             高亮
             被选中 --> 设置button的selected属性为YES
             被禁用 －－> 设置button为enabled
             */
            
            //背景图片
            
            downloadButton.setBackgroundImage(UIImage(named: "buttongreen"), forState: UIControlState.Normal)
            
            downloadButton.setBackgroundImage(UIImage(named: "buttongreen_highlighted"), forState: UIControlState.Highlighted)
            
            //文字
            downloadButton.setTitle("下载", forState: UIControlState.Normal)
            downloadButton.titleLabel?.font = UIFont.systemFontOfSize(13)
            
            yellowView.addSubview(downloadButton)
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

