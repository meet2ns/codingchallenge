//
//  ApplicationButtons.swift
//  Expo Mobile
//
//  Created by Onebyte LLC on 6/9/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation
import UIKit

public enum UIButtonBorderSide {
    case Top, Bottom, Left, Right
}

extension UIButton{
    func configure(backgroundColor: UIColor, borderColor: UIColor, textColor: UIColor, shouldLeftPad: Bool, target: AnyObject, action: Selector) -> Void {
        self.backgroundColor = backgroundColor
        
        self.setTitleColor(textColor, for: .normal)
        
        self.layer.borderColor = borderColor.cgColor
        
        self.layer.masksToBounds = true
        
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
//    func setAttributedTitle(title: String)-> Void {
//        let dictionary1:[String:Any] = [
//            NSAttributedStringKey.underlineStyle.rawValue:NSUnderlineStyle.styleSingle.rawValue]
//        let attributedString = NSMutableAttributedString()
//
//        attributedString.append(NSAttributedString(string: title, attributes: dictionary1))
//
//        self.setTitleColor(UIColor.black, for: .normal)
//
//        self.setAttributedTitle(attributedString, for: .normal)
//    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    public func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }


}
