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
    @IBOutlet weak var topLogoContainerView: UIView!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var bottomLineView_Email: UIView!
    @IBOutlet weak var bottomLineView_password: UIView!
    @IBOutlet weak var bottomLineView_SelectRole: UIView!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSelectRole: UIButton!
    
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var selectRoleContainerView: UIView!
    
    var selectedRole:String?
    
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
            
            self.navigationController?.navigationBar.isHidden = true
            
            self.title = NSLocalizedString("login", comment: "Navigation Title")
            
            let placeHolderTextColor:UIColor = UIColor.init(hexString: Globals.shared.colorForTextBoxPlaceHolder)
            
            let attributedPlaceholderStringUsername:NSAttributedString = NSAttributedString(string: self.txtUsername.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderTextColor])
            self.txtUsername.attributedPlaceholder = attributedPlaceholderStringUsername
            
            let attributedPlaceholderStringPW:NSAttributedString = NSAttributedString(string: self.txtPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderTextColor])
            self.txtPassword.attributedPlaceholder = attributedPlaceholderStringPW
            
            let borderColorOfTextFiels:UIColor = UIColor.init(hexString: Globals.shared.colorForTextBoxBorders)
            
            
            self.usernameContainerView.addRightBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            self.usernameContainerView.addBottomBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            
            self.passwordContainerView.addRightBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            self.passwordContainerView.addBottomBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            
            self.selectRoleContainerView.addRightBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            self.selectRoleContainerView.addBottomBorderWithColor(color: borderColorOfTextFiels, width: 1.0)
            
        }, delay: 0.0)
        
        self.updateCircularViewForTopLogo()
    }
    
    func updateViews() -> Void
    {
        AsyncUtil.onMainThread({
            
           self.navigationController?.navigationBar.isHidden = true
            
        }, delay: 0.0)
    }
    
    // MARK: - Other Methods
    func updateCircularViewForTopLogo()
    {
        AsyncUtil.onMainThread({
            
            let container = UIView(frame: self.topLogoContainerView.bounds)
            container.backgroundColor = .clear
            
            let buttonRadius: CGFloat = (container.frame.width)/2
            let buttonSize = CGSize(width: buttonRadius * 2, height: buttonRadius * 2)
            let buttonPath = UIBezierPath(arcCenter: CGPoint(x: buttonRadius, y: buttonRadius), radius: buttonRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            
            // only for shadow
            let buttonBackgroundView = UIView(frame: CGRect(origin: .zero, size: buttonSize))
            buttonBackgroundView.backgroundColor = .clear
            buttonBackgroundView.center = container.center
            buttonBackgroundView.layer.masksToBounds = false
            buttonBackgroundView.layer.cornerRadius = buttonRadius
            buttonBackgroundView.layer.shadowOffset = .zero
            buttonBackgroundView.layer.shadowRadius = 5
            buttonBackgroundView.layer.shadowOpacity = 0.5
            buttonBackgroundView.layer.shadowPath = buttonPath.cgPath
            container.addSubview(buttonBackgroundView)
            
            // circle button view
            let buttonView1 = UIView(frame: CGRect(origin: .zero, size: buttonSize))
            buttonView1.backgroundColor = .white
            buttonView1.frame.origin = .zero
            let buttonShape1 = CAShapeLayer()
            buttonShape1.path = buttonPath.cgPath
            buttonView1.layer.mask = buttonShape1
            buttonBackgroundView.addSubview(buttonView1)
            
            
            let marginInnerCircle:CGFloat = 20.0
            
            let buttonRadius2: CGFloat = (buttonView1.frame.width - marginInnerCircle)/2
            let buttonSize2 = CGSize(width: buttonRadius2 * 2, height: buttonRadius2 * 2)
            let buttonPath2 = UIBezierPath(arcCenter: CGPoint(x: buttonRadius2, y: buttonRadius2), radius: buttonRadius2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            
            // circle button view 2
            let buttonView2:UIImageView = UIImageView(frame: CGRect(origin: .zero, size: buttonSize2))
            buttonView2.center = buttonBackgroundView.center
            buttonView2.backgroundColor = .clear
            let buttonShape2 = CAShapeLayer()
            buttonShape2.path = buttonPath2.cgPath
            buttonView2.layer.mask = buttonShape2
            buttonView2.image = UIImage.init(named: "school_logo")
            buttonView1.addSubview(buttonView2)
            
            self.topLogoContainerView.addSubview(container)
            
        }, delay: 0.0)
    }
    
    
 
    // MARK: - IBActions Methods
    
    
    
    
    
    
    
    // MARK: - Local Notifications
    @objc func localNotificationReceived(notification: Notification)
    {
        let notificationName:String = notification.name.rawValue
        print("Local Notification Received: \(notificationName)")
        
    
       
    }
   
    // MARK: Valication
  

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

