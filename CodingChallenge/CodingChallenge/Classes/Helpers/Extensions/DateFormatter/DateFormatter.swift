////
////  DateFormatter.swift
////  expomobile-swift
////
////  Created by Onebyte LLC on 22/06/2017.
////  Copyright © 2017 Onebyte LLC. All rights reserved.
////
//
//import Foundation
//
//extension DateFormatter {
//    
//    convenience init (format: String) {
//        self.init()
//        dateFormat = format
//        locale = Locale.current
//    }
//}
//
//extension String {
//    
//    func toDate (format: String) -> Date? {
//        return DateFormatter(format: format).date(from: self)
//    }
//    
//    func toDateString (inputFormat: String, outputFormat:String) -> String? {
//        if let date = toDate(format: inputFormat) {
//            return DateFormatter(format: outputFormat).string(from: date)
//        }
//        return nil
//    }
//}
//
//extension Date {
//    
//    func toString (format:String) -> String? {
//        return DateFormatter(format: format).string(from: self)
//    }
//}
