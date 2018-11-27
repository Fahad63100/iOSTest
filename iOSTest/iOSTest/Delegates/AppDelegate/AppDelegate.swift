//
//  AppDelegate.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

import UserNotifications

import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate
{
    var window: UIWindow?
    
    var navigationController: UINavigationController?

    // MARK: - UIApplicationDelegate Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        //////////////////////////////////////////////////////////////////////////////
        let mainStoryboardObj:UIStoryboard? = UIStoryboard(name: Globals.shared.kStoryBoardName_MainStoryboard, bundle: Bundle.main)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.navigationController = mainStoryboardObj!.instantiateViewController(withIdentifier: Globals.shared.kStoryBoardIdentifiersForVC_MainNavigationVC) as? UINavigationController
        
        self.setUpAppearance()
        
        let searchUserVC:SearchUserViewController = mainStoryboardObj!.instantiateViewController(withIdentifier: Globals.shared.kStoryBoardIdentifiersForVC_SearchUserVC) as! SearchUserViewController
        self.navigationController?.viewControllers = [searchUserVC]
        
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        //////////////////////////////////////////////////////////////////////////////
        
        
        // Check if launched from notification
        // 1
        if let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        {
            // 2
            let aps = notification["aps"] as! [String: AnyObject]
            print("Launched with APS: \(aps)")
        }

        //////////////////////////////////////////////////////////////////////////////
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    
    
    // MARK: - Appearance
    func setUpAppearance()
    {
        let navTitleFont1 = UIFont(name: "Roboto-Bold", size: 20.0)
//        let navTitleFont2 = UIFont(name: "Roboto-Regular", size: 18.0)
        
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().isTranslucent = true
        
        self.window!.backgroundColor = UIColor(hexString: "0076BF", alpha: 1.0)
        
        // Setting the shadow view at bottom of navigation bar
//        UINavigationBar.appearance().shadowImage = nil
//        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.shouldRasterize = true
        ////////////////////////////////////////////////////////////////////////////////////
        
        /*
         ////////////////////////////
         // Set Nav Background Image
         ////////////////////////////
         //        let navBarImageName = "NavBarBg"
         //        let navBarImage = UIImage(named: navBarImageName)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
         // UIBarMetricsDefault
         //        UINavigationBar.appearance().setBackgroundImage(navBarImage, for: .any, barMetrics: .default)
         ////////////////////////////////////////////////////////////////////////////////////
         */
        
        // Color for Navigation bar's buttons like "< Back"
        let navButtonsTextColor = UIColor.init(hexString: Globals.shared.kColor__AppColorScheme_NavBackButtonColor, alpha: 1.0)
        UINavigationBar.appearance().tintColor = navButtonsTextColor
        
        // Navigation bar background color
        UINavigationBar.appearance().barTintColor = UIColor.init(hexString: Globals.shared.kColor__AppColorScheme_NavBackGroundColor, alpha: 1.0)

        
        ////////////////////
        // Nav Title
        ////////////////////
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        
        // Navigation bar Title foreground color
        let navFgColor:UIColor = UIColor.white
        
        // Navigation bar Title background color
        let navBgColor:UIColor = UIColor.clear
        
        if let aFont = navTitleFont1 {
            UINavigationBar.appearance().titleTextAttributes = [
                .shadow : shadow,
                .font : aFont,
                .foregroundColor : navFgColor,
                .backgroundColor : navBgColor,
            ]
        }
        ////////////////////////////////////////////////////////////////////////////
        
        
        /////////////////////////
        // Set Back Button Image
        /////////////////////////
        let myImage = UIImage(named: "NavBackButton") //set your backbutton imagename
        let backButtonImage: UIImage? = myImage?.withRenderingMode(.alwaysOriginal)
        
        // now use the new backButtomImage
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -200.0, vertical: 0), for: .default)
        UIBarButtonItem.appearance().setBackButtonBackgroundVerticalPositionAdjustment(0.0, for: .default)
        
//        self.navigationController?.navigationBar.backItem?.title = ""
//        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
//        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
//        self.navigationController?.navigationItem.backBarButtonItem?.style = UIBarButtonItem.Style.plain
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        
  
        
    }

    

}






