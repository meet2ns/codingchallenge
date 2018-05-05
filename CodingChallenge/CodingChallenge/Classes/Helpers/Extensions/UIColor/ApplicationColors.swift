//
//  ApplicationColors.swift
//  Expo Mobile
//
//  Created by Onebyte LLC on 6/9/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func navigationColor() -> UIColor{
        return UIColor(red:0.6, green:0.78, blue:0.14, alpha:1)
    }
    
    class func customGreenColor() -> UIColor{
        return UIColor(red:0.6, green:0.78, blue:0.14, alpha:1)
    }
    
    class func customBlackColor() -> UIColor{
        return UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
    }
    
    class func customGrayColor() -> UIColor{
        return UIColor.darkGray
    }
    
    class func menuGrayColor() -> UIColor{
        return UIColor(red:85.0/255.0, green:85.0/255.0 ,blue:85.0/255.0 , alpha:1.00)
    }

    
    class func purpleBodyColor() -> UIColor{
        return UIColor(red:65.0/255.0, green:107.0/255.0 ,blue:153.0/255.0 , alpha:1.00)
    }
    
    class func cellBackgroundColor() -> UIColor{
        return UIColor(red:239.0/255.0, green:239.0/255.0 ,blue:239.0/255.0 , alpha:1.00)
    }

    class func cellSelectedTextColor() -> UIColor{
        return UIColor(red:254.0/255.0, green:192.0/255.0 ,blue:198.0/255.0 , alpha:1.00)
    }

    class func tableViewBackgroundColor() -> UIColor{
        return UIColor(red:235.0/255.0, green:235.0/255.0 ,blue:235.0/255.0 , alpha:1.00)
    }

}
