//
//  ProfileLogicViewController.swift
//  Groupify
//
//  Created by Chingiz Mardanov on 4/14/18.
//  Copyright © 2018 Chingiz Mardanov. All rights reserved.
//

import UIKit
import Eureka



class ProfileLogicViewController: FormViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Chingiz:User = User()
        Chingiz.firstName = "Chingiz"
        Chingiz.lastName = "Mardanov"
        Chingiz.age = 5
        
        var subview: UIView?
        subview = Chingiz.getContactChipForFrame(CGRect.init(x: 0, y: 0, width: self.profileImage.frame.height, height: self.profileImage.frame.width), 35)
        self.profileImage.addSubview(subview!)
        
        form +++ Section("Personal Information")
            <<< TextRow(){ row in
                row.title = "First Name"
                row.placeholder = "John"
            }
            <<< TextRow(){ row in
                row.title = "Last Name"
                row.placeholder = "Doe"
            }
            <<< IntRow(){ row in
                row.title = "Age"
                row.placeholder = "5"
            }
            <<< TextRow(){ row in
                row.title = "Description"
                row.placeholder = "I like Pina Coladas, and getting caught in the rain \n I´m not much into health food, I am into champagne \n I´ve got to meet you by tomorrow noon, and cut through all this red tape \nAt a bar called O'Malley's, where we´ll plan our escape"
            }
        }
    
    
    
//    func setupProfileImage() -> UIImage{
//        
//        var subview: UIView?
//        subview = self.contact.getContactChipForFrame(CGRect.init(x: 0, y: 0, width: self.profileImage.frame.height, height: self.profileImage.frame.width), 35)
//        self.profileImage.viewWithTag(420)?.removeFromSuperview()
//        subview?.tag = 420
//        self.profileImage.addSubview(subview!)
//
//    let borderColor = self.contact.getContactColor()
//    self.profileImage.cropToCircleWithBorder(2.0, borderColor: borderColor)
//    }
//    
//    
//    func getContactChipForFrame(_ frame: CGRect, _ fontSize: CGFloat = 16.0, _ alpha: CGFloat = 0.0) -> UIView? {
//        
//        let view = UIView(frame: frame)
//        
////        if let photoImage = self.getContactPhoto() {
////            // We have a photo, set the imageview to that
////            let imageView = UIImageView(frame: CGRect(x: 0,y: 0,width: frame.width,height: frame.height))
////            imageView.image = photoImage
////            view.addSubview(imageView)
////        }
//        //else {
//            // We don't have a photo.  Make a grey namecard.
//            let label = UILabel(frame: CGRect(x: 0,y: 0,width: frame.width,height: frame.height))
//            
//            label.adjustsFontSizeToFitWidth = true
//            
//            if let displayName = displayName {
//                let splitName = displayName.characters.split(whereSeparator: { $0 == " " })
//                let initials = splitName.flatMap({ (word) -> Character? in
//                    return word.first
//                })
//                label.text = String(initials)
//            }
//            else {
//                var labelString = self.name![0] as String
//                if self.lastName != nil {
//                    labelString += self.lastName![0] as String
//                }
//                label.text = labelString
//            }
//            
//            label.font = label.font.withSize(fontSize)
//            label.textColor = getContactColor()
//            
//            label.font = label.font.withSize(fontSize)
//            label.textColor = getContactColor()
//            
//            //label.textColor = UIColor.white
//            label.backgroundColor = UIColor(white: 1, alpha: alpha)
//            label.textAlignment = .center
//            
//            view.addSubview(label)
////        }
//        
//        view.cropToCircleWithBorder(1, borderColor:self.getContactColor())
//        
//        return view
//    }
}


  
    


