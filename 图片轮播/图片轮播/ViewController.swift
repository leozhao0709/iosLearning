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
    
    var timer: NSTimer?
    
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
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.didClickButton(_:)), userInfo: nil, repeats: true)
        
        let mainLoop = NSRunLoop.mainRunLoop()
        mainLoop.addTimer(self.timer!, forMode: NSRunLoopCommonModes)
    }
    
    func setupScrollView() {
        
        let scrollViewSize = scrollView.frame.size
        
        for i in 0..<kImageCount {
            
            let imageViewX: CGFloat = CGFloat(i) * scrollViewSize.width
            
            let imageView = UIImageView(frame: CGRectMake(imageViewX, 0, scrollViewSize.width, scrollViewSize.height))
            
            
            imageView.image = UIImage(named: String(format: "img_%02d", i + 1))
            
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSizeMake(CGFloat(kImageCount) * scrollViewSize.width, 0)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.pagingEnabled = true
    }
    
    /**
     setUp pageControl
     */
    func setupPageControl() {
        pageControl.numberOfPages = kImageCount
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.timer?.invalidate()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.initImageTimer()
    }

    @IBAction func didClickButton(sender: UIButton) {
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

