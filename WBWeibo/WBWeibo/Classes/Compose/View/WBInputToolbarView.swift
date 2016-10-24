//
//  WBInputToolbarView.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/23/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBInputToolbarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    /**
     Just init different UI subviews here, no frame need here
     */
    private func setupUI() {
        
        self.backgroundColor = UIColor.lightGray
        
        self.setupBtn(normalImage: #imageLiteral(resourceName: "compose_toolbar_picture"), highlightedImage: #imageLiteral(resourceName: "compose_toolbar_picture_highlighted"))
        
        self.setupBtn(normalImage: #imageLiteral(resourceName: "compose_mentionbutton_background"), highlightedImage: #imageLiteral(resourceName: "compose_mentionbutton_background_highlighted"))
        
        self.setupBtn(normalImage: #imageLiteral(resourceName: "compose_trendbutton_background"), highlightedImage: #imageLiteral(resourceName: "compose_trendbutton_background_highlighted"))
        
        self.setupBtn(normalImage: #imageLiteral(resourceName: "compose_emoticonbutton_background"), highlightedImage: #imageLiteral(resourceName: "compose_emoticonbutton_background_highlighted"))
        
        self.setupBtn(normalImage: #imageLiteral(resourceName: "compose_keyboardbutton_background"), highlightedImage: #imageLiteral(resourceName: "compose_keyboardbutton_background_highlighted"))
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.subviews.count
        let width: CGFloat = self.width/CGFloat(count)
        
        for i in 0 ..< count {
            let btn = self.subviews[i]
            btn.height = self.height
            btn.width = width
            btn.x = CGFloat(i) * btn.width
            btn.y = 0
        }
        
    }
    
    private func setupBtn(normalImage: UIImage?, highlightedImage: UIImage?) {
        let btn = UIButton()
        btn.setImage(normalImage, highlightImage: highlightedImage)
        btn.addTarget(self, action: #selector(self.btnClick(btn:)), for: .touchUpInside)
        
        self.addSubview(btn)
    }
    
    @objc private func btnClick(btn: UIButton) {
        
    }

}
