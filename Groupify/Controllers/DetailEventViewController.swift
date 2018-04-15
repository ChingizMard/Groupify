//
//  DetailEventViewController.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit
import Eureka

class DetailEventViewController : FormViewController{
    
    var event: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        form +++ Section("Event Information")
            <<< TextRow(){ row in
                row.title = "Event Title"
                row.placeholder = "Soccer Game"
                row.baseCell.isUserInteractionEnabled = false
            }
            <<< TextRow(){ row in
                row.title = "Locartion"
                row.placeholder = "Doe"
            }
            <<< IntRow(){ row in
                row.title = "Spots Availiable"
                row.placeholder = "5"
            }
            <<< TextAreaRow().cellSetup({ (cell, row) in
                cell.height = ({return 250})
                row.title = "Description"
                row.cell.textView.contentSize.height = 300
                //var font = UIFont(name: "ProximaNova-Regular", size: CGFloat(12))
                //row.cell.textView.font?.withSize(10)
                //row.textAreaHeight = CGFloat(100)
                //row.cell.textView.font = font
                row.value = "If you like Pina Coladas, and getting caught in the rain \n I´m not much into health food, I am into champagne \n I´ve got to meet you by tomorrow noon, and cut through all this red tape \nAt a bar called O'Malley's, where we´ll plan our escape"
            })
            <<< ButtonRow(){ row in
                row.title = "Join Event"
        }
    }
}
