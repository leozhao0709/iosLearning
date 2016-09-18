//
//  NSTimeIntervalExtension.swift
//  音乐
//
//  Created by Lei Zhao on 9/2/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    /**
     convert the NSTimeInterval to minute and second format
     
     - returns: miute and second format string
     */
    func converToMinuteSecondWithSecond() -> String{
        
        let minutes = Int(self / 60)
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        
        if minutes < 10 {
            return String(format: "%02d:%02d", minutes, seconds)
        }
        
        return String(format: "%d%:02d", minutes, seconds)
    }
}
