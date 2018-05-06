//
//  NetworkConstants.swift
//  expomobile-swift
//
//  Created by Onebyte LLC on 12/06/2017.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import Foundation

struct AppNetworkConstants {
    static let kBaseURLString                       = "http://api.icndb.com/jokes/"
}

struct AppNetworkEndPoints {
    static let kGetAllRandomJokes         = "random"

}



struct AppNetworkStatusCodes {
    static let kNoInternerAccess                    = -1004;
}


struct AppNetworkStatusStrings {
    static let kSuccessStatus                       = "Success"
}
