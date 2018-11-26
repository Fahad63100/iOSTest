//
//  DateTimeHelper.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

class DateTimeHelper
{
    static let sharedInstance = DateTimeHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    var defaultDateFormatter = DateFormatter()
    
    class func convertStringIntoDate(dateString:String) -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Globals.shared.DateFormate__yyyy_MM_dd //Your date format
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateString) //according to date format your date string
        print(date ?? "") //Convert String to Date
        
        return date
    }
    
    func GetDateFromString(DateStr: String)-> Date
    {
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let DateArray = DateStr.components(separatedBy: "-")
        let components = NSDateComponents()
        components.year = Int(DateArray[0])!
        components.month = Int(DateArray[1])!
        components.day = Int(DateArray[2])!
        components.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = calendar?.date(from: components as DateComponents)
        
        return date!
    }
    
    
    
    
}


