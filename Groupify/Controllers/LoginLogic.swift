//
//  LoginLogic.swift
//  Groupify
//
//  Created by Sandesh Bhandari on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class Login{
    
    var _url = "http://localhost:4000/user/login"
    
    func isauthenticated() -> Bool{
        var username = self.retrieveFromKeychain(key: "groupify_username")
        var password = self.retrieveFromKeychain(key: "groupify_password")
        if (username != "" && password != ""){
            return true
        }else{
            return false
        }
    }

    func authenticate(completion: @escaping(_ success: Bool) -> Void, username:String, password:String) {
        var requestDictionary = Dictionary<String, Any>()
        requestDictionary["username"] = username
        requestDictionary["password"] = password
        var successful = false
        APIService.post(completion: {(success, rDictionary) -> Void in
            if (!success){
                print("Post Request Failed")
                completion(successful)
                return
            }else{
                self.saveToKeychain(value: username, key: "groupify_username")
                self.saveToKeychain(value: password, key: "groupify_password")
                successful = true
                completion(successful)
                return
            }
        },_url, parameters: requestDictionary)
            /* Implement handling code for the returned Bool */
        
    }
    
    func logout() -> Bool{
        let rUsername:Bool = removeFromKeychain(key: "_username")
        let rPassword:Bool = removeFromKeychain(key: "_password")
        if (!rUsername || !rPassword){
            print("Failed to Log Out")
            return false
        }
        return true
    }
    
    /*
     returns true if successful else returns false
    */
    func saveToKeychain(value: String, key: String) -> Bool{
        guard value != "" && key != ""  else{
            print("The value or key provided is empty!")
            return false
        }
        
        let successful: Bool = KeychainWrapper.standard.set(value, forKey: key);
        if (successful){
            print("Successfully saved to the keychain!")
            return true
        }else{
            print("Failed saving to the keychain")
            return false
        }
    }
    
    /*
     returns true if successful else returns false
     */
    func removeFromKeychain(key: String) -> Bool {
        guard key != "" else{
            print("The key provided is empty!")
            return false
        }
        
        let successful: Bool = KeychainWrapper.standard.removeObject(forKey: key);
        if (successful){
            print("Successfully removed from the keychain!")
            return true
        }else{
            print("Failed removing from the keychain")
            return false
        }
    }
    
    /*
     returns the string for the key provided from the keychain
     */
    func retrieveFromKeychain(key: String) -> String{
        guard key != "" else{
            print("The key provided is empty!")
            return ""
        }
        
        let value:String? = KeychainWrapper.standard.string(forKey: key)
        if let value = value {
            return value
        }else{
            print("Failed retrieving value from the keychain!")
            return ""
        }
    }
}
