//
//  ViewController.swift
//  RealmLearning
//
//  Created by Lei Zhao on 9/3/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog("\(NSHomeDirectory())")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let realm = try! Realm()
        
        let jim = Person()
        jim.age.value = 18
        jim.name = "Jim"
        
        let dog = Dog()
        dog.name = "Rex"

        jim.dogs.append(dog)
        

        try! realm.write({
            realm.add(jim)
        })
        
        NSLog(#function)
    }

}



