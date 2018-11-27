//
//  UserDetailsViewController.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

import QuartzCore

class UserDetailsViewController: UIViewController
{
    var foundUserObj:User?
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userImageLoadingActivityView: UIActivityIndicatorView!
    
    @IBOutlet var lblUsername: UILabel!
    
    @IBOutlet var lblUserEmail: UILabel!
    
    @IBOutlet var userInfoContainerVew: UIView!
    
    
    // MARK: - View Controller Life Cycle Methods
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        

        
    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.navigationController = self.navigationController
        
        self.setupViews()
        
        

    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.updateViews()
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super .viewWillDisappear(animated)
        
        
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    
    // MARK: - Other Methods
    func setupViews() -> ()
    {
        AsyncUtil.onMainThread({
            
            self.navigationController?.navigationBar.isHidden = false
            
            self.title = NSLocalizedString("User Details", comment: "Navigation Title")
            
           
            
        }, delay: 0.0)
        
    }
    
    func updateViews() -> Void
    {
        AsyncUtil.onMainThread({
            
           self.navigationController?.navigationBar.isHidden = false
            

            let placeHolderImage:UIImage? = UIImage.init(named: "userPlaceHolderImage")
            self.userImageView.imageFromServerURL((self.foundUserObj?.userPictureURLString)!, placeHolder: placeHolderImage, userImageLoadingActivityView:self.userImageLoadingActivityView)
            
            
            
            guard let fname:String = self.foundUserObj?.firstName else
            {
                fatalError("fname is nil")
            }
            
            guard let lname:String = self.foundUserObj?.lastName else
            {
                fatalError("lname is nil")
            }
            
            self.lblUsername.text = fname + " " + lname
            
            self.lblUserEmail.text = self.foundUserObj?.userEmail
            

            
            let borderColorOfTextFields:UIColor = UIColor.init(hexString: Globals.shared.colorForTextBoxBorders)
            
            self.userInfoContainerVew.addRightBorderWithColor(color: borderColorOfTextFields, width: 1.0)
            self.userInfoContainerVew.addBottomBorderWithColor(color: borderColorOfTextFields, width: 1.0)
            
            
        }, delay: 0.0)
    }
    
    
    
    
    
 
    // MARK: - IBActions Methods
    
    
    
    
    
    // MARK: - Local Notifications
    @objc func localNotificationReceived(notification: Notification)
    {
        let notificationName:String = notification.name.rawValue
        print("Local Notification Received: \(notificationName)")
        
    
       
    }
   
    

    // MARK: - Status Bar Style
    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Device Orientation
    override open var shouldAutorotate: Bool
    {
        get
        {
            return false
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation
    {
        get
        {
            return UIInterfaceOrientation.portrait
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        get
        {
            return UIInterfaceOrientationMask.portrait
        }
    }

    
   
    
}

