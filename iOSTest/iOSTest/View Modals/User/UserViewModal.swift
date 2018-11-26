//
//  UserViewModal.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit
import Foundation

class UserViewModal
{
    var email:String?
    var password:String?
    var relatedViewController:UIViewController?
    
    init(withEmail email:String?,
         withPassword password:String?,
         callingFromViewController relatedViewController:UIViewController?)
    {
        self.email = email
        self.password = password
        self.relatedViewController = relatedViewController
    }
    
    convenience init(withEmail email:String?,
                     callingFromViewController relatedViewController:UIViewController?)
    {
        self.init(withEmail: email,
                  withPassword: nil,
                  callingFromViewController: relatedViewController)
    }
    
    
    // MARK: - archive/unArchive logged-in user
    class func archiveLoggedInUserObject(userObj: User)
    {
        let loggedInUserData:Data = NSKeyedArchiver.archivedData(withRootObject: userObj)
        
        UserDefaults.standard.set(loggedInUserData, forKey: Globals.shared.kUserSession__loggedInUserObjKey)
        UserDefaults.standard.synchronize()
    }
    
    class func unArchiveLoggedInUserObject() -> User?
    {
        var loggedInUserObj:User? = nil
        if let loggedInUserData:Data = UserDefaults.standard.data(forKey: Globals.shared.kUserSession__loggedInUserObjKey)
        {
            loggedInUserObj = (NSKeyedUnarchiver.unarchiveObject(with: loggedInUserData) as? User)!
        }
        
        return loggedInUserObj
    }
    
}

