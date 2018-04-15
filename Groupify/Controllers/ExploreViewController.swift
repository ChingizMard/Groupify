//
//  SecondViewController.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit
import ObjectMapper

class ExploreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Do not remove this code. This is a subview.
        var storyboard = UIStoryboard(name: "Explorer", bundle: nil)
        var controller = storyboard.instantiateInitialViewController() as! UINavigationController
        EventLogic.getEvents(completion: { (success, result, error) in
            if (!success) {
                //self.errorIfReachable("Could not get Contact from server.", subtitle: error)
                print(error)
            }
            else {
                //Send this result to the child controller!!
                
                //self.eventsList = result
                let firstVC = controller.viewControllers[0] as! ExploreLogicViewController
                firstVC.eventsList = result?.events
                
                self.addChildViewController(controller)
                self.view.addSubview(controller.view)
                controller.didMove(toParentViewController: self)
            }
        })
       
        //////////////////////////////////////////////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

