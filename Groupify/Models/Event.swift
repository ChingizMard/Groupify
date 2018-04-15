//
//  Event.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
//import ObjectMapper

class Event{
    var id: Int = 0
    var title :String?
    var description :String?
    var participantsCapacity :Int?
    
    init(title: String, description: String, participants_capacity: Int) {
        self.title = title
        self.description = description
        self.participantsCapacity = participants_capacity
    }
    /**
//     The constructor required by ObjectMapper
//     */
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    /**
//     The mapping function for ObjectMapper.  This function relates model
//     properties to fields in a JSON Response.
//
//     - parameter map: The map of the JSON response
//     */
//    func mapping(map: Map) {
//        if id == 0 {
//            id <- map["id"]
//        }
//
//        title <- map["title"]
//        description <- map["description"]
//        participantsCapacity <- map["capacity"]
//    }
//
}
