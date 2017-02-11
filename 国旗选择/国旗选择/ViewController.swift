//
//  ViewController.swift
//  国旗选择
//
//  Created by Lei Zhao on 7/27/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    lazy var dataArray: [FlagModel]! = {
       
        let path = Bundle.main.path(forResource: "03flags.plist", ofType: nil)
        let tempArray = NSArray(contentsOfFile: path!)
        
        var flagsArray:[FlagModel] = []
        
        for dict in tempArray! {
            let model = FlagModel(dict: dict as! [String : String])
            
            flagsArray.append(model)
        }
        
        return flagsArray
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return self.dataArray[row].name
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let flagView = FlagView.flagView()
        
        flagView.flag = self.dataArray[row]
        
        return flagView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return FlagView.rowHeight()
    }


}

