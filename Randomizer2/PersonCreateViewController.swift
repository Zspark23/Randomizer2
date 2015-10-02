//
//  PersonCreateViewController.swift
//  Randomizer2
//
//  Created by Zack Spicer on 10/2/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

class PersonCreateViewController: UIViewController {
    
    @IBOutlet weak var personNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configurePageWithPerson(person: Person) {
        self.personNameTextField.text = person.name
        
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if let name = self.personNameTextField.text {
            let person = Person(name: name)
            PersonController.sharedInstance.savePerson(person)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

}
