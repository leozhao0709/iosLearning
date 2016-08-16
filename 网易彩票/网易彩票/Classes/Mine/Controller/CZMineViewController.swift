//
//  CZMineViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/10/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class CZMineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingBtnClick(sender: UIBarButtonItem) {
        
        let settingVC = CZSettingViewController()
        
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }


}
