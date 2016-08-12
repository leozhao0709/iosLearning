//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let path = NSBundle.mainBundle().pathForResource("cars_simple.plist", ofType: nil)

let tempArray = NSArray(contentsOfFile: path!)
print(tempArray!)

//let tempArray = NSDictionary(contentsOfFile: path!)
//print(tempArray)

var hello: ()->(String) = {
    return "Hello World!"
}

hello()