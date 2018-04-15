//
//  Activities.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/15/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
import ObjectMapper

class Activities : Mappable{

    var events:[Event]?
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        
        events <- map["activities"]
        
    }

}
