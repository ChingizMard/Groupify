//
//  SecondViewController.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Do not remove this code. This is a subview.
        var storyboard = UIStoryboard(name: "Explorer", bundle: nil)
        var controller = storyboard.instantiateInitialViewController() as! UIViewController
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        //////////////////////////////////////////////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

