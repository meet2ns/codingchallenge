//
//  SelectNameView.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class SelectNameView: UIView {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    func configureTextFieldsLayout() -> Void {
        self.firstNameField.updateTextFieldLayoutWithOnlyBottomBorderSize(borderWidth: 1.0, borderColor: UIColor.lightGray, textField: self.firstNameField)
        self.lastNameField.updateTextFieldLayoutWithOnlyBottomBorderSize(borderWidth: 1.0, borderColor: UIColor.lightGray, textField: self.lastNameField)
    }
    
    func validateFieldsData() -> Bool {
        if !self.firstNameField.hasText{
            AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: ApplicationAlertMessages.kEnterFirstName)
            return false
        }
        else if !self.lastNameField.hasText{
            AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: ApplicationAlertMessages.kEnterLastName)
            return false
        }
        else{
            return true
        }
        
    }

}
