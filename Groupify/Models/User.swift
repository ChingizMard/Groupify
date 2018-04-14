//
//  User.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import Foundation
import ObjectMapper


class User : Mappable{
    var id = 0
    var firstName: String?
    var lastName: String?
    var age: Int?
    var description: String?
    
    /**
     The constructor required by ObjectMapper
     */
    required convenience init?(map: Map) {
        self.init()
    }
    
    /**
     The mapping function for ObjectMapper.  This function relates model
     properties to fields in a JSON Response.
     
     - parameter map: The map of the JSON response
     */
    func mapping(map: Map) {
        if id == 0 {
            id <- map["id"]
        }
        
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        description <- map["description"]
    }
    
    
        func getContactChipForFrame(_ frame: CGRect, _ fontSize: CGFloat = 16.0, _ alpha: CGFloat = 0.0) -> UIView? {
    
            let view = UIView(frame: frame)
    
    //        if let photoImage = self.getContactPhoto() {
    //            // We have a photo, set the imageview to that
    //            let imageView = UIImageView(frame: CGRect(x: 0,y: 0,width: frame.width,height: frame.height))
    //            imageView.image = photoImage
    //            view.addSubview(imageView)
    //        }
            //else {
                // We don't have a photo.  Make a grey namecard.
                let label = UILabel(frame: CGRect(x: 0,y: 0,width: frame.width,height: frame.height))
    
                label.adjustsFontSizeToFitWidth = true
                var displayName = firstName! + " " + lastName!
        
                let splitName = displayName.characters.split(whereSeparator: { $0 == " " })
                let initials = splitName.flatMap({ (word) -> Character? in
                    return word.first
                })
                label.text = String(initials)
            
    
                label.font = label.font.withSize(fontSize)
                label.textColor = UIColor.gray
    
    
                //label.textColor = UIColor.white
                label.backgroundColor = UIColor(white: 1, alpha: alpha)
                label.textAlignment = .center
    
                view.addSubview(label)
    //        }
    
            view.cropToCircleWithBorder(1, borderColor: UIColor.green)
    
            return view
        }
    
    
    
}
