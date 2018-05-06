//
//  ListJokesHandler.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesHandler: NSObject {

    var viewController: ListJokesController!
    var view: ListJokesView!
    
    // MARK: Init
    required init(viewController: ListJokesController!) {
        self.viewController = viewController
        self.view = self.viewController.listJokesView
    }
    
    //MARK: Callbacks
    public var didReceiveSuccessCallback : ((_ responseObject: AnyObject?) -> Void)?
    public var didRecieveErrorCallback : ((_ error: Error?) -> Void)?
}
