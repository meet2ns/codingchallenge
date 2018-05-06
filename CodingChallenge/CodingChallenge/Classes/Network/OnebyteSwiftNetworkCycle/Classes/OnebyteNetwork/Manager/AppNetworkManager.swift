//
//  File.swift
//  expomobile-swift
//
//  Created by Onebyte LLC on 12/06/2017.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppNetworkManager {
    // MARK: Class Variables
    static let sharedInstance = AppNetworkManager()
    
    static func openNetworkRequest (methodType: Alamofire.HTTPMethod!, path: String?, parameters: [String : Any]?) -> URLRequestConvertible {
        OnebyteNetworkRequest.baseURLString = AppNetworkConstants.kBaseURLString
        OnebyteNetworkRequest.path = path
        OnebyteNetworkRequest.method = methodType
        OnebyteNetworkRequest.parameters = parameters
        OnebyteNetworkRequest.headers = nil

        
        return OnebyteNetworkRequest.InitiateRequest()
    }
    
    static func openNetworkRequestWithNonStringLeaves (methodType: Alamofire.HTTPMethod!, path: String?, parameters: [String : Any]?) -> URLRequestConvertible {
        OnebyteNetworkRequest.baseURLString = AppNetworkConstants.kBaseURLString
        OnebyteNetworkRequest.path = path
        OnebyteNetworkRequest.method = methodType
        OnebyteNetworkRequest.parameters = parameters as? [String : String]
        OnebyteNetworkRequest.headers = nil
        
        return OnebyteNetworkRequest.InitiateRequest()
    }
    

    static func closeNetworkRequest (methodType: Alamofire.HTTPMethod!, path: String?, parameters: [String : Any]?) -> URLRequestConvertible {
        OnebyteNetworkRequest.baseURLString = AppNetworkConstants.kBaseURLString
        OnebyteNetworkRequest.path = path
        OnebyteNetworkRequest.method = methodType
        OnebyteNetworkRequest.parameters = parameters
        OnebyteNetworkRequest.headers = ["X-Parse-Application-Id": "Estadio", "Content-Type": "application/json"]

//        var userObject: JNLoginResponseModel?
//
//        if let response = (PINCache.shared().object(forKey: "user-object")){
//            userObject = JNLoginResponseModel(json: JSON(response))
//        }
//        
//        //Add header dictionary e.g
//        if let token = userObject?.token{
//            OnebyteNetworkRequest.headers = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
//        }
        
        return OnebyteNetworkRequest.InitiateRequest()
    }
}
