//
//  LoginViewController.swift
//  Groupify
//
//  Created by Sandesh Bhandari on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit

class LogininViewController: UIViewController{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UITextView!
    var login = Login();
    
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        print("Login Button Clicked")
        if username.text == "" || password.text == "" {
            errorMessage.text = "Enter both username and password!"
        }else{
            if (login.authenticate(username: username.text!, password: password.text!)) {
                print("Login Successful!")
            }else{
                print("Login Failed!")
            }
        }
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        print("Create Account Clicked")
    }
}
