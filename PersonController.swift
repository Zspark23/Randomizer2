//
//  PersonController.swift
//  Randomizer2
//
//  Created by Zack Spicer on 10/2/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

class PersonController: NSObject {
    
    static let sharedInstance = PersonController()
    var allPeopleArray: [[String : AnyObject]] = []
    
    func getAllPeople() -> [[String : AnyObject]] {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let people = defaults.objectForKey("allPeopleKey") {
            return people as! [[String : AnyObject]]
        } else {
            return []
        }
    }
    
    func savePerson(person: Person) {
        let defaults = NSUserDefaults.standardUserDefaults()
        allPeopleArray = getAllPeople()
        allPeopleArray.append(person.toAnyObject())
        defaults.setObject(allPeopleArray, forKey: "allPeopleKey")
    }
}
