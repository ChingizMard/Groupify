//
//  Event.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
import ObjectMapper

class Event : Mappable{
    var id: String?
    var title :String?
    var description :String?
    var participantsCapacity :Int?
    var location: Location = Location()
    

    /**
//     The constructor required by ObjectMapper
//     */
    required convenience init?(map: Map) {
        self.init()
    }
//
//    /**
//     The mapping function for ObjectMapper.  This function relates model
//     properties to fields in a JSON Response.
//
//     - parameter map: The map of the JSON response
//     */
    func mapping(map: Map) {
        id <- map["_id"]
        location.center <- map["loc"]

        title <- map["name"]
        //description <- map["description"]
        participantsCapacity <- map["maxAttendees"]
    }

}
