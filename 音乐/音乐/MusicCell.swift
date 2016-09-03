//
//  MusicCell.swift
//  音乐
//
//  Created by Lei Zhao on 9/1/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    
    var music: Music? {
        didSet {
            self.textLabel?.text = music!.name
            self.textLabel?.textColor = UIColor.whiteColor()
            self.detailTextLabel?.text = music!.singer
            self.detailTextLabel?.textColor = UIColor.whiteColor()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func musicCellWithTableView(tableView: UITableView) -> MusicCell {
        let ID = "MusicCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? MusicCell
        
        if cell == nil {
            cell = MusicCell(style: .Subtitle, reuseIdentifier: ID)
            cell?.backgroundColor = UIColor.clearColor()
            cell?.selectionStyle = .None
        }
        
        return cell!
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            self.backgroundColor = UIColor(red: 0.17, green: 0.46, blue: 0.67, alpha: 1)
        } else {
            self.backgroundColor = UIColor.clearColor()
        }
    }

}
