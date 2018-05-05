//
//  ApplicationColors.swift
//  Expo Mobile
//
//  Created by Onebyte LLC on 6/9/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation
import UIKit

struct ApplicationFontNames {
    static let kLatoRegular = "Lato-Regular";
    static let kLatoBold = "Lato-Bold";
    
    static let kOpenSansRegular = "OpenSans-Regular";
    static let kOpenSansBold = "OpenSans-Bold";
    static let kOpenSansSemiBold = "OpenSans-Semibold";
    
    static let kRobottoRegular = "Roboto-Regular";
    static let kRobottoBold = "Roboto-Bold";
    static let kRobottoSemiBold = "Roboto-Medium";

}

struct ApplicationFontSizes {
    static let kNavigationTitleFontSize = 17.0;
    static let kTextfieldFontSize = 12.0;

}

extension UIFont {
    class func regularLatoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kLatoRegular, size: size)!
    }
    
    class func boldLatoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kLatoBold, size: size)!
    }
    
    class func regularOpenSansFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kOpenSansRegular, size: size)!
    }
    
    class func boldOpenSansFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kOpenSansBold, size: size)!
    }
   
    class func semiBoldOpenSansFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kOpenSansSemiBold, size: size)!
    }
    
    class func regularRobottoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kRobottoRegular, size: size)!
    }
    
    class func boldRobottoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kRobottoBold, size: size)!
    }
    
    class func semiBoldRobottoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name:ApplicationFontNames.kRobottoSemiBold, size: size)!
    }
    
}
