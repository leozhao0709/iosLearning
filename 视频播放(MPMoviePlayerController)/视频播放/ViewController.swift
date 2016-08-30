//
//  ViewController.swift
//  视频播放
//
//  Created by Lei Zhao on 8/29/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CZMoviePlayerViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let movieVC = CZMoviePlayerViewController()
        movieVC.movieURL = NSBundle.mainBundle().URLForResource("promo_full.mp4", withExtension: nil)
        movieVC.captureTimes = [2.0]
        
        movieVC.delegate = self
        
        self.presentViewController(movieVC, animated: true, completion: nil)
    }
    
    func moviePlayerViewController(viewController: CZMoviePlayerViewController, didFinishCaptureImage image: UIImage) {
        self.imageView.image = image
    }

}

