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
        datePicker.locale = Locale(identifier: "en")
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    lazy var toolbar: UIToolbar? = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        
        let cancel = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelClick))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
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
    
    @objc fileprivate func cancelClick() {
        self.view.endEditing(true)
    }
    
    @objc fileprivate func btnClick() {
        
        let date = self.datePicker?.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        
        self.textField.text = formatter.string(from: date!)
        
        self.textField.resignFirstResponder()
        
    }


}

