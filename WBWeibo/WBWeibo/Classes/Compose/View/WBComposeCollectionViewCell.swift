//
//  WBComposeCollectionViewCell.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/23/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import SnapKit

protocol WBComposeCollectionViewCellDelegate {
    func composeCollectionViewCell(cell: WBComposeCollectionViewCell, addPhotoBtnClick: WBComposeCollectionViewButton)
    
    func composeCollectionViewCell(cell: WBComposeCollectionViewCell, deletePhotoBtnClick: WBComposeCollectionViewButton)
}

class WBComposeCollectionViewCell: UICollectionViewCell {
    
    weak var addBtn: WBComposeCollectionViewButton?
    weak var deleteBtn: WBComposeCollectionViewButton?
    var itemIndex: Int?
    
    var iconImage: UIImage? {
        didSet {
            if let image = self.iconImage {
                self.addBtn?.setImage(image, for: .normal)
                self.deleteBtn?.isHidden = false
            } else {
                self.deleteBtn?.isHidden = true
                self.addBtn?.setImage(#imageLiteral(resourceName: "compose_pic_add"), highlightImage: #imageLiteral(resourceName: "compose_pic_add_highlighted"))
            }
        }
    }
    
    var delegate: WBComposeCollectionViewCellDelegate?
    
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
        let addBtn = WBComposeCollectionViewButton()
        addBtn.setImage(#imageLiteral(resourceName: "compose_pic_add"), highlightImage: #imageLiteral(resourceName: "compose_pic_add_highlighted"))
        self.addBtn = addBtn
        self.addSubview(addBtn)
        addBtn.addTarget(self, action: #selector(self.addPhoto), for: .touchUpInside)
        
        let deleteBtn = WBComposeCollectionViewButton()
        deleteBtn.setImage(#imageLiteral(resourceName: "compose_location_icon_delete"), highlightImage:#imageLiteral(resourceName: "compose_location_icon_delete")
        )
        deleteBtn.addTarget(self, action: #selector(self.deletePhoto), for: .touchUpInside)
        self.deleteBtn = deleteBtn
        self.addSubview(deleteBtn)
        
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.addBtn?.snp.makeConstraints({ (make) in
            
            make.edges.equalTo(0)
        })
        
        
        self.deleteBtn?.snp.makeConstraints({ (make) in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(25)
        })
        
    }
    
    // MARK: - button function
    @objc private func addPhoto() {
//        printActionLog()
        
        if let delegate = self.delegate {
            delegate.composeCollectionViewCell(cell: self, addPhotoBtnClick: self.addBtn!)
        }
        
    }
    
    @objc private func deletePhoto() {
//        printActionLog()
        
        if let delegate = self.delegate {
            delegate.composeCollectionViewCell(cell: self, deletePhotoBtnClick: self.deleteBtn!)
        }
        
    }
    
    
}
