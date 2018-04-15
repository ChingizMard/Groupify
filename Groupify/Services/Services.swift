//
//  Services.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

/*
    Returning JSON format
 {
    message: "failed/passed",
    username: "some_username",
    password: "some_password"
 }
 
*/


import Foundation
import Alamofire

class APIService{
    
    static func getRequestHeaders() -> HTTPHeaders{
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        return headers
    }
    
    static func post(completion: @escaping (_ success: Bool, _ rDictinary:Dictionary<String, Any>?) -> Void,_ url: String, parameters: [String: Any]? = nil){
        let headers = self.getRequestHeaders()
        var rDictionary:Dictionary<String, Any>?
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<600).responseJSON { response in
            switch response.result {
            case .success:
                print("Post Successful!")
                if let _json = response.result.value {
                    print("JSON: \(_json)")
                    //let json = try? JSONSerialization.jsonObject(with: response.result, options: [])
                    if let dictionary = response.result.value as? [String:Any] {
                        //rDictionary = dictionary
                        print(dictionary["success"] as! Bool)
                        if (dictionary["success"] as! Bool){
                            completion(true, dictionary)
                        }else{
                            completion(false, nil)
                        }
                    }
                }
            case .failure(let error):
                print(error)
                completion(false, nil)
            }
        }
    }
    
    
    static func postUniversal(_ url: String, parameters: [String: Any]? = nil) -> DataRequest {
        let headers = self.getRequestHeaders()
        // return Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON, headers: headers).validate()
        return Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate()
    }
    
    
    /* Might have to change the return value */
    static func delete(_ url: String, parameters: [String: Any]? = nil) -> DataRequest {
        let headers = self.getRequestHeaders()
        // return Alamofire.request(.DELETE, url, parameters: parameters, encoding: .JSON, headers: headers).validate()
        return Alamofire.request(url, method: .delete, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Delete Successful!")
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
