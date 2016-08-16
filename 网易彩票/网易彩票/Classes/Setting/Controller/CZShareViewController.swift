//
//  CZShareViewController.swift
//  网易彩票
//
//  Created by Lei Zhao on 8/14/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MessageUI

class CZShareViewController: CZBaseSettingViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //第一组
        let item1 = CZSettingArrowItem(icon: "WeiboSina", title: "新浪微博")
        
        let item2 = CZSettingArrowItem(icon: "SmsShare", title: "短信分享")
        item2.operation = {
            [weak self] _ in
            // 此方法不能设置内容
            // UIApplication.sharedApplication().openURL(NSURL(string: "sms://10086")!)
            
            
            //使用messageUI框架可以设置内容
            if !MFMessageComposeViewController.canSendText() {
                NSLog("cannot send text")
                return
            }
            let msgVc = MFMessageComposeViewController()
            
            msgVc.messageComposeDelegate = self
            
            msgVc.recipients = ["10086", "10010"]
            
            msgVc.body = "恭喜中奖，请选择汇款....."
            
            self!.presentViewController(msgVc, animated: true, completion: nil)
        }
        
        let item3 = CZSettingArrowItem(icon: "MailShare", title: "邮件分享")
        item3.operation = {
            [weak self] _ in
           
           // UIApplication.sharedApplication().openURL(NSURL(string: "mailto://leo.zhao.real@gmail.com")!)
            
            let mailVc = MFMailComposeViewController()
            
            mailVc.mailComposeDelegate = self
            
            mailVc.setToRecipients(["leo.zhao.real@gmail.com", "zhao434@usc.edu"])
            
            mailVc.setBccRecipients([])
            
            mailVc.setMessageBody("恭喜你中奖", isHTML: false)
            
            self?.presentViewController(mailVc, animated: true, completion: nil)
        }
        
        let group1 = CZSettingGroup()
        group1.items = [item1, item2, item3]
        self.cellData.append(group1)
    }

    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        //public var MessageComposeResultCancelled: MessageComposeResult { get }
        //public var MessageComposeResultSent: MessageComposeResult { get }
        //public var MessageComposeResultFailed: MessageComposeResult { get }
        
        if result == MessageComposeResultCancelled || result == MessageComposeResultSent {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
//        @constant   MFMailComposeResultCancelled   User canceled the composition.
//        @constant   MFMailComposeResultSaved       User successfully saved the message.
//        @constant   MFMailComposeResultSent        User successfully sent/queued the message.
//        @constant   MFMailComposeResultFailed      User's attempt to save or send was unsuccessful.
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    deinit {
        NSLog("CZShareViewController被释放了")
    }

}
