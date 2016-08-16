//
//  ViewController.swift
//  02.UIKit坐标系
//
//  Created by Lei Zhao on 7/12/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeFatherViewColor(sender: UIButton) {
        let fatherView = sender.superview
        
        fatherView?.backgroundColor = UIColor.redColor()
    }

    @IBAction func changeFatherColorRnadom(sender: UIButton) {
        let fatherView = sender.superview
        
        let randomR = CGFloat(arc4random_uniform(255))/255.0
        let randomG = CGFloat(arc4random_uniform(255))/255.0
        let randomB = CGFloat(arc4random_uniform(255))/255.0
        
        let randomColor = UIColor(red: randomR, green: randomG, blue: randomB, alpha: 1)
        
        fatherView?.backgroundColor = randomColor
    }
    
    @IBAction func createView(sender: UIButton) {
        let createView = UIView()
        
        createView.frame = CGRectMake(20, 400, 100, 100)
        createView.backgroundColor = UIColor.purpleColor()
        
        self.whiteView.addSubview(createView)
    }
    
    @IBAction func createViewAndMove(sender: AnyObject) {
        let createView = UIView(frame: CGRectMake(0, 0, 100, 100))
        
        createView.backgroundColor = UIColor.redColor()
        
        whiteView.addSubview(createView)
        
        var oldFrame = createView.frame
        oldFrame.origin.x = 100;
        
        UIView.animateWithDuration(3) { 
            createView.frame = oldFrame
        }
        
    }
    
}

