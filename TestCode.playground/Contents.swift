//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let path = NSBundle.mainBundle().pathForResource("cars_simple.plist", ofType: nil)
//
//let tempArray = NSArray(contentsOfFile: path!)
//print(tempArray!)
//
////let tempArray = NSDictionary(contentsOfFile: path!)
////print(tempArray)
//
//var hello: ()->(String) = {
//    return "Hello World!"
//}
//
//hello()

let dict = ["January 2016":1, "August 2016":3, "January 2017":2]

let byValue = {
    (elem1:(key: String, val: Int), elem2:(key: String, val: Int))->Bool in
    if elem1.key < elem2.key {
        return true
    } else {
        return false
    }
}
let sortedDict = dict.sorted(by: byValue)

public enum AVAuthorizationStatus : Int {
    
    
    case notDetermined
    
    case restricted
    
    case denied
    
    case authorized
}

AVAuthorizationStatus.notDetermined.rawValue
