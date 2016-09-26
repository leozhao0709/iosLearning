//
//  WBDefaultCenterView.swift
//  WBWeibo
//
//  Created by Lei Zhao on 9/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

protocol  WBDefaultCenterViewDelegate{
    func defaultCenterView(defaultCenterView: WBDefaultCenterView, didclickLogin loginBtn: UIButton)
    func defaultCenterView(defaultCenterView: WBDefaultCenterView, didclickRegister registerBtn: UIButton)
}

class WBDefaultCenterView: UIView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var turnTableImageView: UIImageView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    var delegate: WBDefaultCenterViewDelegate?
    
    var link: CADisplayLink?
    
    var iconImage: UIImage? {
        didSet {
            self.iconImageView.image = self.iconImage
        }
    }
    
    var info: String?{
        didSet {
            self.descriptionLabel.text = self.info
        }
    }
    
    static func defaultCenterView()->WBDefaultCenterView {
        return Bundle.main.loadNibNamed("WBDefaultCenterView", owner: nil, options: nil)?.first as! WBDefaultCenterView
    }
    
    func startTurnTableRotate() {
        let link = CADisplayLink(target: self, selector: #selector(self.update))
        self.link = link
        self.link?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
    }
    
    func stopTurnTableRotate() {
        self.link?.invalidate()
    }
    
    @objc private func update() {
        if !self.turnTableImageView.isHidden {
            self.turnTableImageView.transform = self.turnTableImageView.transform.rotated(by: CGFloat.pi/100.0)
        }
    }

    @IBAction func registerBtnClick(_ sender: UIButton) {
        
        if let delegate = self.delegate {
            delegate.defaultCenterView(defaultCenterView: self, didclickRegister: sender)
        }
        
    }
    
    @IBAction func loginBtnClick(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.defaultCenterView(defaultCenterView: self, didclickLogin: sender)
        }
    }
    
    
}
