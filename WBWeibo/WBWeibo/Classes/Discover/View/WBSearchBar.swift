//
//  WBSearchBar.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/21/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBSearchBar: UITextField {

    var leftIcon: UIImage? {
        didSet{
            let icon = UIImageView(image: leftIcon)
            icon.width = 30
            icon.contentMode = .center
            self.leftView = icon
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    
    /**
     Just add UI, No frame need here
     */
    func setupUI() {
        self.placeholder = "请输入您想要搜索的内容"
        
        self.leftViewMode = .always
        
        self.leftIcon = #imageLiteral(resourceName: "searchbar_searchlist_search_icon")
        
        self.clearButtonMode = .always
        
        self.borderStyle = .roundedRect
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
    }


}
