//
//  ViewController.swift
//  省市选择
//
//  Created by Lei Zhao on 7/26/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var selProvice: ProvinceModel?
    lazy var dataArray:[ProvinceModel]! = {
        let path = NSBundle.mainBundle().pathForResource("02cities.plist", ofType: nil)
        let tempArray = NSArray(contentsOfFile: path!)
        
        var provinceArray:[ProvinceModel] = []
        
        for dict in tempArray! {
            let province = ProvinceModel(dict: dict as! [String : AnyObject])
            provinceArray.append(province)
        }
        
        return provinceArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        //redundant
//        self.provinceLabel.text = self.dataArray[0].name
//        self.cityLabel.text = self.dataArray[0].cities[0]
        
        self.pickerView(self.pickerView, didSelectRow: 0, inComponent: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return self.dataArray.count
        }
        else
        {
            let selectProvinceIndex = pickerView.selectedRowInComponent(0)
            
            self.selProvice = self.dataArray[selectProvinceIndex]
            
            return (self.selProvice?.cities.count)!
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return self.dataArray[row].name
        }
        else
        {
//            let selectProvinceIndex = pickerView.selectedRowInComponent(0)
//            let cities = self.dataArray[selectProvinceIndex].cities
//            
//            self.selProvice = self.dataArray[selectProvinceIndex]
            
//            return cities[row]
            
            return self.selProvice?.cities[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }

        let selectProvinceIndex = pickerView.selectedRowInComponent(0)
        let selectCityIndex = pickerView.selectedRowInComponent(1)
        
        let selectProvince = self.dataArray[selectProvinceIndex]
        let selectCities = selectProvince.cities
        
        self.provinceLabel.text = selectProvince.name
//        self.cityLabel.text = selectCities[selectCityIndex]
        
        self.cityLabel.text = self.selProvice?.cities[selectCityIndex]
    }


}

