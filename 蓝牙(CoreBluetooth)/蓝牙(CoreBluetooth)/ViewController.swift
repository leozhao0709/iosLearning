//
//  ViewController.swift
//  蓝牙(CoreBluetooth)
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {

    let mgr = CBCentralManager()
    
    lazy var peripherals: [CBPeripheral] = {
       return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mgr.delegate = self
        
        //扫描外界设备(传nil扫描外界所有设备)
        self.mgr.scanForPeripheralsWithServices(nil, options: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CBcenteralManager的代理方法
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
    }
    
    /**
     发现外围设备时候调用此方法
     
     - parameter central:
     - parameter peripheral:        发现的外界设备
     - parameter advertisementData: 外界设备发出的信号
     - parameter RSSI:              信号强度
     */
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        if !self.peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
        }
    }
    
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        //nil表示扫描所有
        peripheral.discoverServices(nil)
        
        peripheral.delegate = self
    }
    
    //连接设备
    func connect(peripheral: CBPeripheral) {
        self.mgr.connectPeripheral(peripheral, options: nil)
    }
    
    
    /**
     外围设备的delegate
     
     发现外围设备会的服务会来到该方法（扫描到服务之后直接添加到peripheral的service中）
     - parameter peripheral: <#peripheral description#>
     */
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        for service in peripheral.services! {
            if service.UUID.UUIDString == "123" {
                peripheral.discoverCharacteristics(nil, forService: service)
            }
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        for characteristic in service.characteristics! {
            if characteristic.UUID.UUIDString == "456" {
                
            }
        }
    }
    
    


}

