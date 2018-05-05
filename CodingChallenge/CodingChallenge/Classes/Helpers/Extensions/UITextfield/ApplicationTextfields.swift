//
//  ApplicationButtons.swift
//  Expo Mobile
//
//  Created by Onebyte LLC on 6/9/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension UITextField {
    func configure(backgroundColor: UIColor, borderColor: UIColor, textColor: UIColor, borderWidth: CGFloat, corners:UIRectCorner, cornerRadius: CGFloat) -> Void {
        
        self.backgroundColor = backgroundColor
        
        self.textColor = textColor
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(ApplicationNumberConstants.kTextfieldLeftPadding), height: self.frame.height))
        self.leftViewMode = .always

        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = true;
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func configureTextField(borderColor: UIColor, textColor: UIColor, borderWidth: CGFloat, corerRadius: CGFloat, textFieldData: String) -> Void {
        self.layer.cornerRadius = corerRadius
        self.layer.borderWidth = 2.0
        self.layer.borderColor = borderColor.cgColor
        self.textColor = textColor
        self.clipsToBounds = true
        self.attributedPlaceholder = NSAttributedString(string: textFieldData, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])

        self.setLeftPaddingPoints(20)
    }
    
    func configureTextFieldPlaceholderColor(placeholderColor: UIColor, textFieldData: String) -> Void {
        self.attributedPlaceholder = NSAttributedString(string: textFieldData, attributes: [NSAttributedStringKey.foregroundColor : placeholderColor])
    }
    
    func updateTextFieldLayoutWithOnlyBottomBorderSize(borderWidth:CGFloat, borderColor:UIColor, textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  1900, height: self.frame.size.height)
        border.borderWidth = width
        
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    func addDottedBorderWithTextFieldAndColor(textField: UITextView, color: UIColor) -> Void {
        let ViewBorder = CAShapeLayer()
        ViewBorder.strokeColor = color.cgColor
        ViewBorder.lineDashPattern = [2, 2]
        ViewBorder.frame = textField.bounds
        ViewBorder.fillColor = nil
        ViewBorder.path = UIBezierPath(rect: textField.bounds).cgPath
        textField.layer.addSublayer(ViewBorder)
    }
    
}
