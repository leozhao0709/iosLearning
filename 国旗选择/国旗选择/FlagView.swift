//
//  FlagView.swift
//  国旗选择
//
//  Created by Lei Zhao on 7/27/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class FlagView: UIView {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    var flag: FlagModel! {
        didSet{
            self.nameLabel.text = flag.name
            self.iconView.image = UIImage(named: flag.icon)
        }
    }
    
    static func flagView()->FlagView {
        let flagView = Bundle.main.loadNibNamed("FlagView", owner: nil, options: nil)?.first as! FlagView
        
        return flagView
    }
    
    static func rowHeight()->CGFloat {
        return 82
    }

}
