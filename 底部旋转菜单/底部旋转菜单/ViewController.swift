//
//  ViewController.swift
//  底部旋转菜单
//
//  Created by Lei Zhao on 8/7/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let menu = BottomMenu.bottomMenu()
        
        let menuX: CGFloat = 0
        let menuY = self.view.bounds.height - menu.bounds.height
        let menuW = self.view.bounds.width
        let menuH = menu.bounds.height
        
        menu.frame = CGRectMake(menuX, menuY, menuW, menuH)
        
        self.view.addSubview(menu)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

