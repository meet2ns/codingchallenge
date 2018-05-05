//
//  ApplicationNavigationBar.swift
//  Expo Mobile
//
//  Created by Onebyte LLC on 6/30/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit

extension UINavigationBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat(ApplicationNumberConstants.kNavigationTitleImageHeight))
    }
    
    func setBottomBorderColor(color: UIColor) -> Void {
        let navigationSeparator = UIView(frame: CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 1))
        
        navigationSeparator.backgroundColor = color
        navigationSeparator.isOpaque = true
        
        self.addSubview(navigationSeparator)
    }
}
