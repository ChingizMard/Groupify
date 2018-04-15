//
//  EventLogic.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/15/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
import ObjectMapper


class EventLogic{
    static func getEvents(completion: @escaping (_ success: Bool, _ result: Activities?, _ error: String?) -> Void) {
        var _url = "http://localhost:4000/activity/find_activity"
        var params: [String:Any] = [:]
        
        //Get Current Lat and Lon here!
        params["center"] = [5,40]
        params["radius"] = 20
        params["unique"] = true
        
        APIService.postUniversal(_url, parameters: params).responseJSON {
            response in
            switch response.result {
            case .failure(_):
                completion(false, nil, "error")
                return
            case .success:
                // Parse the JSON response
                print(response.result.value)
                let objects = Mapper<Activities>().map(JSONObject: response.result.value!)
                
                print(objects)
                
                completion(true, objects, nil)
                return
                
            }
        }
    }
    
}
