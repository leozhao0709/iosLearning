//
//  WBInputTextView.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class WBInputTextView: UITextView {

    weak var placeholderLabel: UILabel?
    
    var placeholder: String? {
        didSet{
            self.placeholderLabel?.text = self.placeholder
            self.placeholderLabel?.sizeToFit()
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        let placeholderLabel = UILabel()
        self.font = UIFont.systemFont(ofSize: 15)
        placeholderLabel.font = self.font
        placeholderLabel.numberOfLines = 0
        placeholderLabel.x = 5
        placeholderLabel.y = 7
        placeholderLabel.textColor = UIColor.lightGray
        
        self.placeholderLabel = placeholderLabel
        self.addSubview(placeholderLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.textChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    @objc private func textChange() {
        self.placeholderLabel?.isHidden = self.text.characters.count > 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
