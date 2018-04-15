//
//  Extenssions.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit
import ObjectMapper
import UIKit


public extension UIView {
    
    public func cropToCircle() -> UIView? {
        // Make the photo circular
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
        
        return self
    }
    
    public func cropToCircleWithBorder(_ borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.cropToCircle()
    }
}


