//
//  Model.swift
//  RealmLearning
//
//  Created by Lei Zhao on 9/3/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    dynamic var id = 0
    
    dynamic var name: String = ""
    
    // one to one
//    dynamic var owner: Person?
    
    //Inverse relation
    let owners = LinkingObjects(fromType: Person.self, property: "dogs")
    
    //primary keys
    override static func primaryKey()->String {
        return "id"
    }
    
}

class Person: Object {
    dynamic var id = 0
    
    dynamic var name: String = ""
    dynamic var birthdate = NSDate(timeIntervalSinceNow: 0)
    
    //one to Many
    let dogs = List<Dog>()
    
    //Int, Float, Double and Double, should use RealmOptional to define optional value
    let age = RealmOptional<Int>()
    
    //primary keys
    override static func primaryKey()->String {
        return "id"
    }
}

class Book: Object {
    dynamic var price = 0
    dynamic var title = ""
    
    override static func indexedProperties()->[String] {
        return ["title"]
    }
}

