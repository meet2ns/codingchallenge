//
//  ApplicationNavigationBar.swift
//  Lung Direct
//
//  Created by Onebyte LLC on 6/30/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit
import Foundation

private let characterEntities : [ Substring : Character ] = [
    // XML predefined entities:
    "&quot;"    : "\"",
    "&amp;"     : "&",
    "&apos;"    : "'",
    "&lt;"      : "<",
    "&gt;"      : ">",
    
    // HTML character entity references:
    "&nbsp;"    : "\u{00a0}",
    // ...
    "&diams;"   : "♦",
]

extension String {
    
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Returns a new string made by replacing in the `String`
    /// all HTML character entity references with the corresponding
    /// character.
    var stringByDecodingHTMLEntities : String {
        
        // ===== Utility functions =====
        
        // Convert the number in the string to the corresponding
        // Unicode character, e.g.
        //    decodeNumeric("64", 10)   --> "@"
        //    decodeNumeric("20ac", 16) --> "€"
        func decodeNumeric(_ string : Substring, base : Int) -> Character? {
            guard let code = UInt32(string, radix: base),
                let uniScalar = UnicodeScalar(code) else { return nil }
            return Character(uniScalar)
        }
        
        // Decode the HTML character entity to the corresponding
        // Unicode character, return `nil` for invalid input.
        //     decode("&#64;")    --> "@"
        //     decode("&#x20ac;") --> "€"
        //     decode("&lt;")     --> "<"
        //     decode("&foo;")    --> nil
        func decode(_ entity : Substring) -> Character? {
            
            if entity.hasPrefix("&#x") || entity.hasPrefix("&#X") {
                return decodeNumeric(entity.dropFirst(3).dropLast(), base: 16)
            } else if entity.hasPrefix("&#") {
                return decodeNumeric(entity.dropFirst(2).dropLast(), base: 10)
            } else {
                return characterEntities[entity]
            }
        }
        
        // ===== Method starts here =====
        
        var result = ""
        var position = startIndex
        
        // Find the next '&' and copy the characters preceding it to `result`:
        while let ampRange = self[position...].range(of: "&") {
            result.append(contentsOf: self[position ..< ampRange.lowerBound])
            position = ampRange.lowerBound
            
            // Find the next ';' and copy everything from '&' to ';' into `entity`
            guard let semiRange = self[position...].range(of: ";") else {
                // No matching ';'.
                break
            }
            let entity = self[position ..< semiRange.upperBound]
            position = semiRange.upperBound
            
            if let decoded = decode(entity) {
                // Replace by decoded character:
                result.append(decoded)
            } else {
                // Invalid entity, copy verbatim:
                result.append(contentsOf: entity)
            }
        }
        // Copy remaining characters to `result`:
        result.append(contentsOf: self[position...])
        return result
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
