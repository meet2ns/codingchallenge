//
//  ApplicationNavigationBar.swift
//  Lung Direct
//
//  Created by Onebyte LLC on 6/30/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func toAppDateString() -> String{
        let backendDateFormatter = DateFormatter()
        backendDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = backendDateFormatter.date(from: self)
        
        let appDateFormatter = DateFormatter()
        appDateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return appDateFormatter.string(from: date!)
    }
    
    func toCreditCardDateString() -> String{
        let backendDateFormatter = DateFormatter()
        backendDateFormatter.dateFormat = "MMMM d, yyyy"
        let date = backendDateFormatter.date(from: self)
        
        let appDateFormatter = DateFormatter()
        appDateFormatter.dateFormat = "MM/dd/yyyy"
        return appDateFormatter.string(from: date!)
    }

    func calculateDays() -> Int{
        let backendDateFormatter = DateFormatter()
        backendDateFormatter.dateFormat = "MMMM d, yyyy"
        let date = backendDateFormatter.date(from: self)
        
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: date!)
        let date2 = calendar.startOfDay(for: Date())
        
        return calendar.dateComponents([.day], from: date2, to: date1).day!
    }
}
