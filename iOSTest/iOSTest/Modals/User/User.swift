//
//  User.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit
import Foundation

class User: NSObject, NSCoding
{
    var userID:NSNumber?
    var firstName:String?
    var lastName:String?
    var userEmail:String?
    var userPictureURLString: String?
    var userStatus:Int?
    
    var followersArray:[User]?
    
    
    init(with dataDictionary: Dictionary<String, AnyObject>?)
    {
        guard let dictionary = dataDictionary else { return }
        
        self.userID = dictionary["user_id"] as? NSNumber
        self.firstName = dictionary["first_name"] as? String
        self.lastName = dictionary["last_name"] as? String
        self.userEmail = dictionary["email"] as? String
        self.userPictureURLString = dictionary["user_image"] as? String
        self.userStatus = dictionary["status"] as? Int
        
        self.followersArray = []
    }
    
    //MARK: - NSCoding
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(userID, forKey: "userID")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(userEmail, forKey: "userEmail")
        aCoder.encode(userPictureURLString, forKey: "userPictureURLString")
        aCoder.encode(userStatus, forKey: "userStatus")
        
        aCoder.encode(followersArray, forKey: "followersArray")
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        let userID:NSNumber? = aDecoder.decodeObject(forKey: "userID") as? NSNumber
        let firstName:String? = aDecoder.decodeObject(forKey: "firstName") as? String
        let lastName:String? = aDecoder.decodeObject(forKey: "lastName") as? String
        let userEmail:String? = aDecoder.decodeObject(forKey: "userEmail") as? String
        
        let userPictureURLString: String? = aDecoder.decodeObject(forKey: "userPictureURLString") as? String
        
        let userStatus:Int? = aDecoder.decodeObject(forKey: "userStatus") as? Int
        
        let followersArray:[User]? = aDecoder.decodeObject(forKey: "followersArray") as? [User]
        
        let dictionary:Dictionary<String, AnyObject>? = ["user_id":userID as AnyObject,
                                                         "first_name":firstName as AnyObject,
                                                         "last_name":lastName as AnyObject,
                                                         "email":userEmail as AnyObject,
                                                         "status":userStatus as AnyObject,
                                                         "user_image":userPictureURLString as AnyObject,
                                                         "followersArray":followersArray as AnyObject]
        
        self.init(with: dictionary)
    }
}
