//
//  ContactTableViewCell.swift
//  School Management System
//
//  Created by Fahad on 10/09/2018.
//  Copyright © 2018 SMS. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblContactTitle: UILabel!
    @IBOutlet weak var lblContactPhoneNumber: UILabel!
    
    @IBOutlet weak var contactPictureContainerView: UIView!
    
    @IBOutlet weak var cellBgView: UIView!
    
    @IBOutlet weak var imageLoadingActivityView: UIActivityIndicatorView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
}








