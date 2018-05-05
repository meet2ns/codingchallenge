//
//  NSLayouts.swift
//  expomobile-swift
//
//  Created by Onebyte LLC on 20/06/2017.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit
import Foundation

extension NSLayoutConstraint {
    
    override open var description: String {
        let id = identifier ?? ""
        print(id)
        return "id: \(id), constant: \(constant)" 
    }
}
