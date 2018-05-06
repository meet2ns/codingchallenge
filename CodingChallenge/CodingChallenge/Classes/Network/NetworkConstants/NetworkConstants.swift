//
//  NetworkConstants.swift
//  expomobile-swift
//
//  Created by Onebyte LLC on 12/06/2017.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation

struct AppNetworkConstants {
    static let kBaseURLString                       = "http://159.65.37.92:1337/parse"
}

struct AppNetworkEndPoints {
    static let kUserLogin                = "/login"
    static let kAddFacility              = "/classes/Facility"
    static let kUploadFile               = "/files"
    static let kGetAllFacilities         = "/classes/Facility"

}



struct AppNetworkStatusCodes {
    static let kNoInternerAccess                    = -1004;
}


struct AppNetworkStatusStrings {
    static let kSuccessStatus                       = "Success"
}
