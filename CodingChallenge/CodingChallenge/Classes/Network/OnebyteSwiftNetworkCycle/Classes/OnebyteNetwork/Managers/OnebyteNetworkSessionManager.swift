//
//  OnebyteNetworkSessionManager.swift
//  swift-api-cycle
//
//  Created by Humayun Sohail on 1/12/17.
//  Copyright © 2017 Humayun Sohail. All rights reserved.
//

import Foundation
import Alamofire

open class OnebyteNetworkSessionManager : SessionManager{
    
    //MARK: Class Variables
    //static public let sharedInstance = OnebyteNetworkSessionManager()
    
    class public func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return Alamofire.request(urlRequest)
    }
}
