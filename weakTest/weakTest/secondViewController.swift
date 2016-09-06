//
//  secondViewController.swift
//  weakTest
//
//  Created by Lei Zhao on 9/5/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    weak var button: TestButton!
    
    @IBOutlet weak var testButton: TestButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = TestButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.button = button
        self.button.setTitle("Test", forState: .Normal)
        self.button.backgroundColor = UIColor.orangeColor()
        
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.testButton.removeFromSuperview()
        self.button.removeFromSuperview()
    }

    deinit {
        NSLog("第二个controller被释放了")
    }

}
