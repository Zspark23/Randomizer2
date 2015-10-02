//
//  PeopleListViewController.swift
//  Randomizer2
//
//  Created by Zack Spicer on 10/2/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editPerson" {
            
        }
    }

}

extension PeopleListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)
        let person = Person(dictionary: PersonController.sharedInstance.getAllPeople()[indexPath.row])
        
        cell.textLabel!.text = person.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.sharedInstance.getAllPeople().count
    }
}
