//
//  ViewController.swift
//  图片轮播
//
//  Created by Lei Zhao on 7/17/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

let kImageCount = 5

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        self.setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        self.setupScrollView()
        self.setupPageControl()
        self.initImageTimer()
    }
    
    func initImageTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.didClickButton(_:)), userInfo: nil, repeats: true)
        
        let mainLoop = RunLoop.main
        mainLoop.add(self.timer!, forMode: RunLoopMode.commonModes)
    }
    
    func setupScrollView() {
        
        let scrollViewSize = scrollView.frame.size
        
        for i in 0..<kImageCount {
            
            let imageViewX: CGFloat = CGFloat(i) * scrollViewSize.width
            
            let imageView = UIImageView(frame: CGRect(x: imageViewX, y: 0, width: scrollViewSize.width, height: scrollViewSize.height))
            
            
            imageView.image = UIImage(named: String(format: "img_%02d", i + 1))
            
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(kImageCount) * scrollViewSize.width, height: 0)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.isPagingEnabled = true
    }
    
    /**
     setUp pageControl
     */
    func setupPageControl() {
        pageControl.numberOfPages = kImageCount
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.red
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.timer?.invalidate()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.initImageTimer()
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        var offset = scrollView.contentOffset
        
        var currentPage = pageControl.currentPage
        
        if currentPage == kImageCount - 1 {
            currentPage = 0
            offset.x = 0
        }
        else {
            currentPage += 1
            offset.x += scrollView.frame.width
        }
        
        pageControl.currentPage = currentPage
        scrollView.setContentOffset(offset, animated: true)
    }
}

