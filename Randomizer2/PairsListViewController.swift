//
//  ViewController.swift
//  Randomizer2
//
//  Created by Zack Spicer on 10/2/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit
import GameplayKit

class PairsListViewController: UIViewController {
    
    var counter: Int = 0
    var tempArray = []
    @IBOutlet weak var pairsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempArray = newShuffledArray(PersonController.sharedInstance.getAllPeople())
    }
    
    override func viewWillAppear(animated: Bool) {
        counter = 0
        self.pairsListTableView.reloadData()
    }
    
    func newShuffledArray(array: NSArray) -> NSArray {
        let mutableArray = array.mutableCopy() as! NSMutableArray
        let count = mutableArray.count
        if count > 1 {
            for var i = count - 1; i > 0 ; i-- {
                mutableArray.exchangeObjectAtIndex(i, withObjectAtIndex: Int(arc4random_uniform(UInt32(i+1))))
            }
        }
        return mutableArray as NSArray
    }

    @IBAction func shuffleButtonTapped(sender: UIBarButtonItem) {
        tempArray = newShuffledArray(PersonController.sharedInstance.getAllPeople())
        pairsListTableView.reloadData()
    }
}

extension PairsListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("twoPersonCell", forIndexPath: indexPath) as! TwoPersonTableViewCell
        
        if counter != PersonController.sharedInstance.getAllPeople().count {
            let firstPerson = tempArray[counter]
            cell.firstPersonLabel.text = firstPerson["name"] as! String
            counter++
        }
        
        if counter != PersonController.sharedInstance.getAllPeople().count {
            let secondPerson = tempArray[counter]
            cell.secondPersonLabel.text = secondPerson["name"] as! String
            counter++
        }
        
        if counter == PersonController.sharedInstance.getAllPeople().count {
            counter = 0
        }
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if PersonController.sharedInstance.getAllPeople().count % 2 == 0 {
            return PersonController.sharedInstance.getAllPeople().count / 2
        } else {
            return PersonController.sharedInstance.getAllPeople().count / 2 + 1
        }
    }
}

