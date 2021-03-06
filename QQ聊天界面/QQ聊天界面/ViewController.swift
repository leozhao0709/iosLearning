//
//  ViewController.swift
//  QQ聊天界面
//
//  Created by Lei Zhao on 7/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    lazy var dataArray: [QQModel] = {
        let path = NSBundle.mainBundle().pathForResource("messages.plist", ofType: nil)
        
        let tempArray = NSArray(contentsOfFile: path!)
        
        var QQModelArray: [QQModel] = []
        
        for dict in tempArray! {
            let model:QQModel = QQModel(dict: dict as! [String : AnyObject])
            
            if let lastModel = QQModelArray.last {
                if model.time == lastModel.time {                    
                    model.hideTimeLabel = true
                }
            }
            
            QQModelArray.append(model)
        }
        
        return QQModelArray
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.textField.delegate = self
        
        self.registerNotification()
        
        self.scrollToBottom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func registerNotification() {
        
        //监听键盘即将出现
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillAppear), name: UIKeyboardWillShowNotification, object: nil)
        
        //监听键盘即将隐藏
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillDisappear), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillDisappear(notification: NSNotification) {
        
        let dict = notification.userInfo!
        
        let intervalTime = dict[UIKeyboardAnimationDurationUserInfoKey]! as? NSTimeInterval
        
        UIView.animateWithDuration(intervalTime!) {
            self.view.transform = CGAffineTransformIdentity
        }
    }
    
    @objc private func keyboardWillAppear(notification: NSNotification) {
//        NSLog("\(notification)")
        
        let dict = notification.userInfo!
        
//        NSLog("\(dict[UIKeyboardAnimationDurationUserInfoKey]!)")
        
//        NSLog("\((dict[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height)")
        
//        let keyboardEndY = (dict[UIKeyboardFrameEndUserInfoKey]! as! NSValue).CGRectValue().origin.y
//        
//        let keyboardBeignY = (dict[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().origin.y
//        
//        NSLog("\(keyboardEndY - keyboardBeignY)")
        
        let intervalTime = dict[UIKeyboardAnimationDurationUserInfoKey]! as? NSTimeInterval
        
        let keyboardHeight = (dict[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height
        
        UIView.animateWithDuration(intervalTime!) {
            self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifter = "QQ"

        var cell = tableView.dequeueReusableCellWithIdentifier(identifter) as? QQCell
        
        if cell == nil {
            cell = QQCell(style: .Default, reuseIdentifier: identifter)
            
            cell?.selectionStyle = .None
        }
        
        
        let model = self.dataArray[indexPath.row]
        
        cell!.qqModel = model
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let qqModel = self.dataArray[indexPath.row]
        return qqModel.height
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.textField.resignFirstResponder()
        
        self.sendMessage(self.textField.text!, type: QQUserType.Me)
        
        self.sendMessage("小逗逼", type: QQUserType.Other)
        
        self.textField.text = ""
        
        return true
    }
    
    private func sendMessage(content: String, type: QQUserType) {
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        
        //format: yyyy-MM-dd HH:mm:ss
        formatter.dateFormat = "HH:mm"
        let time = formatter.stringFromDate(currentDate)
        
        let text = content
        
        let type = type
        
        let qqModel = QQModel(text: text, time: time, type: type)
//        let qqModel = QQModel()
//        
//        qqModel.text = text
//        qqModel.time = time
//        qqModel.type = type
        
        let lastQQModel = self.dataArray.last!
        if lastQQModel.time == time {
            qqModel.hideTimeLabel = true
        }
        
        self.dataArray.append(qqModel)
        
        let indexPath = NSIndexPath(forRow: self.dataArray.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        self.scrollToBottom()
    }
    
    private func scrollToBottom() {
        let indexPath = NSIndexPath(forRow: self.dataArray.count - 1, inSection: 0)
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}

