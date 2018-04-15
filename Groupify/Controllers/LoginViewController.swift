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
            login.authenticate(completion: {(success) -> Void in
                if (success){
                    print("Login Successful!")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.userAlreadyLoggedIn()
                }else{
                    print("Login Failed!")
                }
                
            } , username: username.text!, password: password.text!)
        }
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        print("Create Account Clicked")
    }
}
