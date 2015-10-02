//
//  Person.swift
//  Randomizer2
//
//  Created by Zack Spicer on 10/2/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import Foundation

class Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(dictionary: [String : AnyObject]) {
        self.name = dictionary["name"] as! String
    }
    
    func toAnyObject() -> [String: AnyObject] {
        return [
            "name": name
        ]
    }
}