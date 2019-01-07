//
//  Globals.h
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

// Json obj mapper
// http://www.jsoncafe.com/?json=1

import UIKit

class Globals
{
    static let shared = Globals()
    
    //Initializer access level change now
    private init(){}
    
    
    
    
    // MARK: - Typedefs
    typealias OperationCompletionBlock = (Bool, Error?) -> Void

    
    // MARK: - Time Zone Types
    enum TimeZoneType : Int {
        case __Local
        case __UTC
    }
    
    public let TimeZoneType__Local:String = "localTimeZone"
    public let TimeZoneType__UTC:String = "UTCTimeZone"
    
    public let DateFormate__yyyy_MM_dd:String = "yyy-mm-dd"
    
    // MARK: - Images
    // default image cache key
    public let kSharedImageCache_Key:String = "SharedImageCache_Key"
    
    // MARK: -  StoryBoards
    public let kStoryBoardName_LaunchScreen:String = "LaunchScreen"
    public let kStoryBoardName_MainStoryboard:String = "Main"
    
    
    // MARK: -  StoryBoard View Controller Identifiers
    // MainStoryboard.storyboard
    
    public let kStoryBoardIdentifiersForVC_MainNavigationVC:String = "MainNVC__SB_ID"
    
    public let kStoryBoardIdentifiersForVC_SearchUserVC:String = "SearchUserVC__SB_ID"
    public let kStoryBoardIdentifiersForVC_UserDetailsVC:String = "UserDetailsVC__SB_ID"
    
    
    
    
//     0 for absents 1 for present and 2 for leave
    // Attendance Types
    public let kAttendanceType_Absent: Int = 0
    public let kAttendanceType_Present: Int = 1
    public let kAttendanceType_Leave: Int = 2
    
    // Minimum Password Length
    public let kMinimumPasswordLength: Int = 3
    
    // User Types
    public let kUserType_Teacher: Int = 1
    public let kUserType_Parent: Int = 2
    
    // Device Types
    public let kDeviceType_iOS:String = "1"
    public let kDeviceType_Android:String = "2"
    
    // Push Notification
    public let kPushNotification_DeviceToken:String = "PushNotificationDeviceToken"
    // View Action Categories
    public let kPushNotificationAction_ViewActionID:String = "NotificationViewActionID"
    public let kPushNotificationAction_ViewCategoryID:String = "NotificationViewCategoryID"
    
    
    // Subject Next Screen
    public let ksubjectNextScreen_ClassDiary:String = "ClassDiary"
    public let ksubjectNextScreen_ClassAssignments:String = "ClassAssignments"
    
    // MARK: -  User Session
    public let kUserSession__UserObjKey:String = "UserSessionLoggedInUserObjKey"
    
    public let kUserSession__UserObjArrayKey:String = "UserObjArrayKey"
    
    
    // SideBarMenu.storyboard
    public let kStoryBoardIdentifiersForNC_SideMenuLeft:String = "SideMenuLeftNC__SB_ID"
//    public let kStoryBoardIdentifiersForVC_SideMenuVC:String = "SideMenuMainVC__SB_ID"
    public let kStoryBoardIdentifiersForNC_SideMenuRight:String = "SideMenuRightNC__SB_ID"
    
    // MARK: -  User Session
    public let kUserSessionObjectKey:String = "userSessionObjectKey"
    
    // MARK: -  Common
    public let kInvisibleSignChar:String = "\u{200B}"

    // MARK: -  First Time App Loaded
    public let kIsFirstTimeAppLoad:String = "isFirstTimeAppLoad"
    
    // MARK: - Mime Types
    public let MimeType__TEXT_Plain:String = "text/plain"
    public let MimeType__TEXT_JSON:String = "text/json"
    
    // MARK: - Characters Limit
    public let kCharactersLimit: Int = 50
    
    // MARK: - Text View paddings
    public let kTextViewPaddings: Int = 5
    
    // MARK: - User Profile Image Size
    public let kUserProfileImageSize_Width: Int = Int(200.0)
    public let kUserProfileImageSize_Height: Int = Int(200.0)
    
    // MARK: - User Password Minimum Length
    public let kValidationRestriction__UserPasswordMinimumLength: Int = 6
    
    // MARK: - App Infos
    public let APP_NAME:String = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String)!
    public let APP_VERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    public let APP_BUILD = Bundle.main.infoDictionary!["CFBundleVersion"] as? String
    
    public let APP_ID:String = "711338920"
    public let COMPANY_NAME:String = "SMS"
    public let POWERED_BY_COMPANY_NAME:String = "SMS"
    public let kEmail_COMPANY_CONTACT_EMAIL:String = "sales@sms.com"
    public let kEmail_CC:String = ""
    public let kEmail_BCC:String = ""
    public let APP_STORE_URL:String = ""
    public let APP_STORE_REVIEW_URL:String = ""


    
    // MARK: - Colors
    let colorForTextBoxPlaceHolder:String = "C7C7CC"
    let colorForTextBoxBorders:String = "E7E7E7"
    public let kColor__AppColorScheme_NavBackButtonColor:String = "#FFFFFF"
    public let kColor__AppColorScheme_NavBackGroundColor:String = "#019AE8"
    
    
    // Redirect URL
    // iOSTestCallBack://accessToken
    public let kOAuth2__AuthorizationCallbackURL:String = "iOSTestCallBack://accessToken"
    
    
    
}
