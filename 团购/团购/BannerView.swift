//
//  BannerView.swift
//  团购
//
//  Created by Lei Zhao on 7/18/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class BannerView: UIView, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var timer: NSTimer?
    
    var imageArray: [String]? {
        didSet {
            
            let bannerViewSize = self.bounds.size
            
            for i in 0..<imageArray!.count {
                let imageName = imageArray![i]
                
                let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * bannerViewSize.width, 0, bannerViewSize.width, bannerViewSize.height))
                
                imageView.image = UIImage(named: imageName)
                
                self.scrollView.addSubview(imageView)
            }
            
            self.scrollView.contentSize = CGSizeMake(CGFloat(imageArray!.count) * bannerViewSize.width, 0)
            
            self.pageControl.numberOfPages = self.imageArray!.count
        }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupScrollView()
        self.setupPageControl()
        self.initImageTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("BannerView has not been implemented")
    }
    
    private func initImageTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(self.imagePlay), userInfo: nil, repeats: true)
    }
    
    @objc private func imagePlay() {
        var offset = self.scrollView.contentOffset
        
        var currentPage = self.pageControl.currentPage
        
        if currentPage == (self.imageArray?.count)! - 1 {
            currentPage = 0
            offset.x = 0
        }
        else
        {
            currentPage += 1
            offset.x += self.scrollView.frame.width
        }
        
        pageControl.currentPage = currentPage
        scrollView.setContentOffset(offset, animated: true)
    }
    
    private func setupScrollView() {
        self.scrollView = UIScrollView(frame: self.bounds)
        
        self.scrollView.pagingEnabled = true
        
        self.scrollView.delegate = self
        
        self.scrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(self.scrollView)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.timer?.invalidate()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.initImageTimer()
    }
    
    private func setupPageControl() {
        let bannerViewSize = self.bounds.size
        
        self.pageControl = UIPageControl(frame: CGRectMake(0, 0, bannerViewSize.width/2, 20))
        
//        self.pageControl.backgroundColor = UIColor.blackColor()
        
        self.pageControl.center = CGPointMake(bannerViewSize.width/2, bannerViewSize.height * 0.9)
        
        self.pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        
        self.pageControl.pageIndicatorTintColor = UIColor.grayColor()
        
        self.addSubview(self.pageControl)
    }
}
