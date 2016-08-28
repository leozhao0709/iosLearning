//
//  ViewController.swift
//  计步器
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let stepCounter = CMPedometer()
    let lengthFormatter = NSLengthFormatter()

    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    private var startDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !CMPedometer.isStepCountingAvailable() {
            NSLog("Not avaliable")
            return
        }
        
    }

    
    //都是count past steps
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        NSLog(#function)
        
//        self.stepCounter.queryPedometerDataFromDate(self.startDate.dateByAddingTimeInterval(-24 * 3600), toDate: self.startDate) { (pedometerData: CMPedometerData?, error: NSError?) in
//            if let keyerror = error {
//                NSLog("error: \(keyerror)")
//                return
//            }
//            
//            
//            NSLog("data: \(pedometerData)")
//            
//            //            NSLog("numberOfSteps: \(pedometerData?.numberOfSteps)")
//            //            NSLog("distance: \(pedometerData?.distance)")
//            
//            dispatch_async(dispatch_get_main_queue(), { 
//                self.stepsLabel.text = "Number of Steps: \(pedometerData!.numberOfSteps)"
//                self.distanceLabel.text = "distance: \(self.lengthFormatter.stringFromMeters((pedometerData!.distance!.doubleValue)))"
//            })
//            
//        }
        
        
        
        self.stepCounter.startPedometerUpdatesFromDate(self.startDate.dateByAddingTimeInterval(-24 * 3600)) { (pedometerData: CMPedometerData?, error: NSError?) in
            if error != nil {
                NSLog("error: \(error)")
                return
            }
            
            NSLog("\(pedometerData)")
            
            NSLog("numberOfSteps: \(pedometerData?.numberOfSteps)")
            NSLog("distance: \(pedometerData?.distance)")
            
            dispatch_async(dispatch_get_main_queue(), {
                self.stepsLabel.text = "number of Steps: \(pedometerData!.numberOfSteps)"
                
                self.distanceLabel.text = "distance: \(self.lengthFormatter.stringFromMeters((pedometerData!.distance!.doubleValue)))"
            })
            
            
        }
        
        
    }
    


}

