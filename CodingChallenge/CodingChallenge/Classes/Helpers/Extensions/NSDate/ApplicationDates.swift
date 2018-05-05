//
//  ApplicationNavigationBar.swift
//  Lung Direct
//
//  Created by Onebyte LLC on 6/30/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit
import Foundation

extension Date {
    func getBackendDateFormatString() -> String{
        let backendDateFormatter = DateFormatter()
        backendDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return backendDateFormatter.string(from: self as Date)
    }
}
