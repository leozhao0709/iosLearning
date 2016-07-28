//
//  ViewController.swift
//  DatePicker使用
//
//  Created by Lei Zhao on 7/27/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    lazy var datePicker: UIDatePicker? = {
        let datePicker = UIDatePicker()
        datePicker.locale = NSLocale(localeIdentifier: "en")
        datePicker.datePickerMode = .Date
        
        return datePicker
    }()
    
    lazy var toolbar: UIToolbar? = {
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 44))
        
        let cancel = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(cancelClick))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: UIControlEvents.TouchUpInside)
        let done = UIBarButtonItem(customView: btn)
        
        toolbar.items = [cancel, flexSpace, done]
        
        return toolbar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //inputView: 默认显示键盘
        self.textField.inputView = self.datePicker
        self.textField.inputAccessoryView = self.toolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func cancelClick() {
        self.view.endEditing(true)
    }
    
    @objc private func btnClick() {
        
        let date = self.datePicker?.date
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        
        self.textField.text = formatter.stringFromDate(date!)
        
        self.textField.resignFirstResponder()
        
    }


}

