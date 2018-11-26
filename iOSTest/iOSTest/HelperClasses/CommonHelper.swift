//
//  CommonHelper.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

class CommonHelper
{
    static let sharedInstance = CommonHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    class func round(_ val: Double, to decimals: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimals
        formatter.roundingMode = .up
        let ret = formatter.string(from: val as NSNumber)
        
        return ret
    }

    
    
    class func setLeftPadding(_ txt: UITextField?)
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        txt?.leftView = paddingView
        txt?.leftViewMode = .always
        txt?.setNeedsLayout()
        txt?.setNeedsDisplay()
    }
    
    class func getLocale() -> String? {
        return NSLocale.preferredLanguages[0]
    }
    
    class func showAllFontsFamiliesNames() -> Void
    {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    class func getLocalizedImage(_ name: String?) -> UIImage? {
        return UIImage(named: "\(URL(fileURLWithPath: name ?? "").deletingPathExtension().absoluteString)_\(CommonHelper.getLocale() ?? "")")
    }
    
    
    // MARK: - Activity Indicator Inside Button
    func showActivityIndicator(_ activityIndicatorForButton: UIActivityIndicatorView?, inside buttonObj: UIButton?) {
        DispatchQueue.main.async(execute: {
            if (buttonObj?.frame.size.width ?? 0.0) <= 133.0 {
                buttonObj?.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
            }
            let halfButtonHeight: CGFloat = (buttonObj?.bounds.size.height ?? 0.0) / 2
            let buttonWidth: CGFloat? = buttonObj?.bounds.size.width
            activityIndicatorForButton?.center = CGPoint(x: (buttonWidth ?? 0.0) - halfButtonHeight, y: halfButtonHeight)
            if let aButton = activityIndicatorForButton {
                buttonObj?.addSubview(aButton)
            }
            activityIndicatorForButton?.hidesWhenStopped = true
            activityIndicatorForButton?.startAnimating()
            buttonObj?.isUserInteractionEnabled = false
            /// Disable Other Controls
            //////////////////////////////////////////////////////////////////////
        })
    }
    
    func hideActivityIndicator(_ activityIndicatorForButton: UIActivityIndicatorView?, inside buttonObj: UIButton?) {
        if activityIndicatorForButton != nil {
            DispatchQueue.main.async(execute: {
                if (buttonObj?.frame.size.width ?? 0.0) <= 133.0 {
                    buttonObj?.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                activityIndicatorForButton?.removeFromSuperview()
                activityIndicatorForButton?.stopAnimating()
                buttonObj?.isUserInteractionEnabled = true
                /// Disable Other Controls
                //////////////////////////////////////////////////////////////////////
            })
        }
    }
    
    
    // MARK: - Country Code for Current Device
    func getCountryCodeForCurrentDevice() -> String? {
        let currentLocale = NSLocale.current as NSLocale // get the current locale.
        let countryCode = currentLocale.object(forKey: .countryCode) as? String
        return countryCode
    }
    
    // MARK: - Images
    func image(with color: UIColor?, andSize imageSize: CGSize) -> UIImage? {
        let imageSizeRect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        UIGraphicsBeginImageContext(imageSizeRect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor((color?.cgColor)!)
        context?.fill(imageSizeRect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    // MARK: - Screen Size
    var appScreenRect: CGRect {
        let appWindowRect = UIApplication.shared.keyWindow?.bounds ?? UIWindow().bounds
        return appWindowRect
    }
    
    
}


