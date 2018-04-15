//
//  EventLogic.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/15/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation


class Event{
    var _url = "http://localhost:4000/activity/find_activity"
    
    static func getEvents(_ completion: @escaping (_ success: Bool, _ result: [Contact]?, _ error: String?) -> Void) {
        let url = APIService.buildAuthURL(servicePath)
        
        APIService.get(url).responseJSON {
            response in
            switch response.result {
            case .failure(_):
                let errorString = JSON(data: response.data!)["error"].string
                completion(false, nil, errorString)
                return
            case .success:
                // Parse the JSON response
                let objects = Mapper<Contact>().mapArray(JSONObject: response.result.value!)
                
                RealmUtils.store(objects)
                
                completion(true, objects, nil)
                return
                
            }
        }
    }
    
}
