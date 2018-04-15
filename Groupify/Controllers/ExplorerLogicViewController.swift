//
//  ExplorerLogicViewController.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit

class ExploreLogicViewController : UITableViewController{
    
    var eventsList: [Event]?
    
    var selectedEvent:Event?
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventCellViewController
        
        cell?.titleLabel.text = eventsList![indexPath.row].title
        cell?.locationLabel.text = "Philadelphia, PA"
        print(eventsList![indexPath.row].title)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60.0;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedEvent = eventsList![indexPath.row]
        self.performSegue(withIdentifier: "showEventDetail", sender: tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        if segue.identifier == "showEventDetail" {
            let vc = segue.destination as! DetailEventViewController
            vc.event = self.selectedEvent!
            
        }
    }
}
