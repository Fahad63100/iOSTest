//
//  SearchUserViewController.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

import QuartzCore

class SearchUserViewController: UIViewController
{
    @IBOutlet weak var txtUsernameOrEmail: UITextField!

    @IBOutlet weak var usernameContainerView: UIView!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    var searchViaEmail:Bool = false
    
    var yPos_txtUsernameOrEmail:CGFloat?
    var yPos_usernameContainerView:CGFloat?
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.updateViews()
        
        
        self.btnSearch.isUserInteractionEnabled = false
        self.btnSearch.setTitle("Please Wait", for: .normal)
        
        UserViewModal.sharedInstance.createAndArchiveUsers()
        
        self.btnSearch.isUserInteractionEnabled = true
        self.btnSearch.setTitle("Search", for: .normal)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super .viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // MARK: - Keyboard Notifications
    @objc func keyboardWillShow(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            self.yPos_txtUsernameOrEmail = self.txtUsernameOrEmail.frame.origin.y
            
            self.yPos_usernameContainerView = self.usernameContainerView.frame.origin.y
            
            
            let newPosY:CGFloat = (self.view.frame.size.height - keyboardSize.height)
            
            if(self.txtUsernameOrEmail.frame.origin.y > newPosY)
            {
                self.txtUsernameOrEmail.frame.origin.y = newPosY
            }
            
            if(self.usernameContainerView.frame.origin.y > newPosY)
            {
                self.usernameContainerView.frame.origin.y = newPosY
            }
            
            
            print("notification: Keyboard will show")
            
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            if let yPos:CGFloat = self.yPos_txtUsernameOrEmail
            {
                self.txtUsernameOrEmail.frame.origin.y = yPos
            }
            
            if let yPos:CGFloat = self.yPos_usernameContainerView
            {
                self.usernameContainerView.frame.origin.y = yPos
            }
            
        }
    }
    
    
    // MARK: - Other Methods
    func setupViews() -> ()
    {
        AsyncUtil.onMainThread({
            
            self.navigationController?.navigationBar.isHidden = false
            
            self.title = NSLocalizedString("User", comment: "Navigation Title")
            
            let borderColorOfTextFields:UIColor = UIColor.init(hexString: Globals.shared.colorForTextBoxBorders)
            
            self.usernameContainerView.addRightBorderWithColor(color: borderColorOfTextFields, width: 1.0)
            self.usernameContainerView.addBottomBorderWithColor(color: borderColorOfTextFields, width: 1.0)
            
        }, delay: 0.0)
        
        
    }
    
    func updateViews() -> Void
    {
        AsyncUtil.onMainThread({
            
           self.navigationController?.navigationBar.isHidden = false
            
        }, delay: 0.0)
    }
    
    // MARK: - Other Methods
    
    
    
 
    // MARK: - IBActions Methods
    
    @IBAction func btnSearchPressed(_ sender: Any)
    {
        if(self.validateForm())
        {
            let searchText:String = (self.txtUsernameOrEmail.text?.lowercased())!
            
            let foundUserObj:User? = UserViewModal.sharedInstance.findUser(userInputString: searchText, isUserInputAsEmail: self.searchViaEmail)
            if let userObj:User = foundUserObj
            {
                let mainStoryboardObj:UIStoryboard? = UIStoryboard(name: Globals.shared.kStoryBoardName_MainStoryboard, bundle: Bundle.main)
                
                let userDetailsVC:UserDetailsViewController = mainStoryboardObj!.instantiateViewController(withIdentifier: Globals.shared.kStoryBoardIdentifiersForVC_UserDetailsVC) as! UserDetailsViewController
                userDetailsVC.foundUserObj = userObj
                self.navigationController?.show(userDetailsVC, sender: self)
            }
            else
            {
                //////////////////////////////
                // Showe Alert
                //////////////////////////////
                let popUpTitle:String? = "User Search"
                let popUpDescriptions:String? = "User Not Found"
                
                if self.parent != nil
                {
                    let alertController = UIAlertController(title: popUpTitle,
                                                            message: popUpDescriptions,
                                                            preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Ok",
                                                            style: .default,
                                                            handler: { (action: UIAlertAction!) in
                                                                print("Handle Ok logic here")
                                                                
                    }))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                ////////////////////////////////////////////
            }
        }
    }
    
    
    
    
    
    
    // MARK: - Local Notifications
    @objc func localNotificationReceived(notification: Notification)
    {
        let notificationName:String = notification.name.rawValue
        print("Local Notification Received: \(notificationName)")
        
    
       
    }
   
    // MARK: - Valication
    func validateForm() -> Bool
    {
        var isSuccess = false
        var errorMsg = ""
        
        if ValidationHelper.isStringEmpty(self.txtUsernameOrEmail.text!)
        {
            self.searchViaEmail = false
            
            errorMsg = "Please enter your Username or Email Address"
        }
        else
        {
            if self.txtUsernameOrEmail.text?.lowercased().range(of:"@") != nil
            {
                self.searchViaEmail = true
                
                if !(ValidationHelper.isValidEmail(testStr: self.txtUsernameOrEmail.text!))
                {
                    errorMsg = "Please enter a valid \"Email Address\""
                }
            }
        }
        
        if !ValidationHelper.isStringEmpty(errorMsg)
        {
            let InvalidInputStr = NSLocalizedString("warning", comment: "Alert Type")
            
            //////////////////////////////
            // Showe Alert
            //////////////////////////////
            let popUpTitle:String? = InvalidInputStr
            let popUpDescriptions:String? = errorMsg
            
            if self.parent != nil
            {
                let alertController = UIAlertController(title: popUpTitle,
                                                        message: popUpDescriptions,
                                                        preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Ok",
                                                        style: .default,
                                                        handler: { (action: UIAlertAction!) in
                    print("Handle Ok logic here")
                                                            
                }))
                
                self.present(alertController, animated: true, completion: nil)
            }
            ////////////////////////////////////////////
            
            isSuccess = false
        }
        else
        {
            isSuccess = true
        }
        
        return isSuccess
    }
  
    // MARK: - Ha
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
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

