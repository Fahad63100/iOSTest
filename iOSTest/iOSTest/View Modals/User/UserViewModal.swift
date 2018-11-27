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
    static let sharedInstance = UserViewModal() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    var userObjArray:[User]?
    
    // MARK: - archive/unArchive a user
    func archiveUserObject(userObj: User)
    {
        let loggedInUserData:Data = NSKeyedArchiver.archivedData(withRootObject: userObj)
        
        UserDefaults.standard.set(loggedInUserData, forKey: Globals.shared.kUserSession__UserObjKey)
        UserDefaults.standard.synchronize()
    }
    
    func unArchiveUserObject() -> User?
    {
        var loggedInUserObj:User? = nil
        if let loggedInUserData:Data = UserDefaults.standard.data(forKey: Globals.shared.kUserSession__UserObjKey)
        {
            loggedInUserObj = (NSKeyedUnarchiver.unarchiveObject(with: loggedInUserData) as? User)!
        }
        
        return loggedInUserObj
    }
    
    // MARK: - archive/unArchive a user
    func archiveUserArray(userObjArray: [User])
    {
        let loggedInUserData:Data = NSKeyedArchiver.archivedData(withRootObject: userObjArray)
        
        UserDefaults.standard.set(loggedInUserData, forKey: Globals.shared.kUserSession__UserObjArrayKey)
        UserDefaults.standard.synchronize()
    }
    
    func unArchiveUserArray() -> [User]?
    {
        var userObjArray:[User]? = nil
        if let userObjArrayData:Data = UserDefaults.standard.data(forKey: Globals.shared.kUserSession__UserObjArrayKey)
        {
            userObjArray = (NSKeyedUnarchiver.unarchiveObject(with: userObjArrayData) as? [User])!
        }
        
        return userObjArray
    }
    
    
    // MARK: - Create And Archive Users
    
    func createAndArchiveUsers()
    {
        if let userArray:[User] = self.unArchiveUserArray()
        {
            NSLog("Found: %@", userArray)
            
            self.userObjArray = userArray
        }
        else
        {
            let jsonStr1:String = """
{ "user_id": 1, "first_name": "Helene", "last_name": "Gait", "email": "hgait0@loc.gov", "user_image": "https://robohash.org/impeditdictaexplicabo.png?size=100x100&set=set1", "status": true }
"""
            
            let jsonStr2:String = """
{ "user_id": 2, "first_name": "Iggie", "last_name": "Giscken", "email": "igiscken1@nymag.com", "user_image": "https://robohash.org/nihilautvitae.png?size=100x100&set=set1", "status": true }
"""
            
            let jsonStr3:String = """
{ "user_id": 3, "first_name": "Eleen", "last_name": "Ricciardi", "email": "ericciardi2@mlb.com", "user_image": "https://robohash.org/utatenim.png?size=100x100&set=set1", "status": false }
"""
            
            let jsonStr4:String = """
{ "user_id": 4, "first_name": "Read", "last_name": "Sooper", "email": "rsooper3@csmonitor.com", "user_image": "https://robohash.org/sedsuntvoluptas.png?size=100x100&set=set1", "status": false }
"""
            
            let jsonStr5:String = """
{ "user_id": 5, "first_name": "Tades", "last_name": "Abela", "email": "tabela4@hp.com", "user_image": "https://robohash.org/inautaliquam.png?size=100x100&set=set1", "status": true }
"""
            
            let jsonStr6:String = """
{ "user_id": 6, "first_name": "Bailey", "last_name": "Baile", "email": "bbaile5@cbsnews.com", "user_image": "https://robohash.org/etpraesentiumeveniet.png?size=100x100&set=set1", "status": true }
"""
            
            let jsonStr7:String = """
{ "user_id": 7, "first_name": "Greg", "last_name": "Ickovits", "email": "gickovits6@smugmug.com", "user_image": "https://robohash.org/eaqueeumtenetur.png?size=100x100&set=set1", "status": false }
"""
            
            let jsonStr8:String = """
{ "user_id": 8, "first_name": "Coretta", "last_name": "Atcheson", "email": "catcheson7@deviantart.com", "user_image": "https://robohash.org/nonaccusamusfugit.png?size=100x100&set=set1", "status": true }
"""
            
            let jsonStr9:String = """
{ "user_id": 9, "first_name": "Omero", "last_name": "Krzysztof", "email": "okrzysztof8@ustream.tv", "user_image": "https://robohash.org/deseruntsaepeea.png?size=100x100&set=set1", "status": false }
"""
            
            let jsonStr10:String = """
{ "user_id": 10, "first_name": "Christen", "last_name": "Hulks", "email": "chulks9@elegantthemes.com", "user_image": "https://robohash.org/blanditiisbeataelaudantium.png?size=100x100&set=set1", "status": true }
"""
            
            let userDict1:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr1)
            
            let userDict2:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr2)
            
            let userDict3:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr3)
            
            let userDict4:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr4)
            
            let userDict5:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr5)
            
            let userDict6:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr6)
            
            let userDict7:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr7)
            
            let userDict8:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr8)
            
            let userDict9:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr9)
            
            let userDict10:Dictionary<String, AnyObject>? = self.convertToDictionary(text: jsonStr10)
            
            
            
            let userObj1:User = User.init(with: userDict1)
            
            let userObj2:User = User.init(with: userDict2)
            
            let userObj3:User = User.init(with: userDict3)
            
            let userObj4:User = User.init(with: userDict4)
            
            let userObj5:User = User.init(with: userDict5)
            
            let userObj6:User = User.init(with: userDict6)
            
            let userObj7:User = User.init(with: userDict7)
            
            let userObj8:User = User.init(with: userDict8)
            
            let userObj9:User = User.init(with: userDict9)
            
            let userObj10:User = User.init(with: userDict10)
            
            
            let userArray:[User] = [userObj1,
                                    userObj2,
                                    userObj3,
                                    userObj4,
                                    userObj5,
                                    userObj6,
                                    userObj7,
                                    userObj8,
                                    userObj9,
                                    userObj10]
            
            self.archiveUserArray(userObjArray: userArray)
            
            self.userObjArray = userArray
        }
        
    }
    
    
    func convertToDictionary(text: String) -> [String: AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    func findUser(userInputString:String, isUserInputAsEmail:Bool) -> User?
    {
        var foundUser:User? = nil
        
        if let usersArray:[User] = self.userObjArray
        {
            for userObj:User in usersArray
            {
                if(isUserInputAsEmail)
                {
                    if(userObj.userEmail == userInputString)
                    {
                        foundUser = userObj
                        break
                    }
                }
                else
                {
                    if( ((userObj.firstName == userInputString) ||
                        (userObj.lastName == userInputString)) ||
                        (userObj.firstName == userInputString && userObj.lastName == userInputString) )
                    {
                        foundUser = userObj
                        break
                    }
                }
            }
        }
        
        return foundUser
    }
    
}

