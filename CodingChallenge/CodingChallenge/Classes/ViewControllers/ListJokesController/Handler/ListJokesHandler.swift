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
    
    
    //MARK: Public Methods
    public func requestFetchingJokesAPI(firstName: String, lastName: String){
        self.handleFetchingRandomJokesAPIRequest(firstName: firstName, lastName: lastName)
    }
    
    
    private func handleFetchingRandomJokesAPIRequest(firstName: String, lastName: String) -> Void {
        
        
        let apiOperation: GetAllJokesOperation = GetAllJokesOperation()
        
        apiOperation.firstName = firstName
        apiOperation.lastName = lastName
        
        weak var weakSelf = self
        
        apiOperation.didFinishSuccessfullyCallback = {response in
            weakSelf?.handleSuccessfulAPIRequest(response: response)
            weakSelf?.handleFinishRequest()
        }
        
        apiOperation.didFinishWithErrorCallback = {error in
            weakSelf?.handleFailedAPIRequest(error: error)
            weakSelf?.handleFinishRequest()
        }
        
        OnebyteNetworkOperationQueue.sharedInstance.addOperation(apiOperation)
    }
    
    // MARK: Common
    private func handleFinishRequest() -> Void {
        //Handle Finish API Call through
    }
    
    // MARK: Events
    private func handleSuccessfulAPIRequest(response : AnyObject!) -> Void {
        if self.didReceiveSuccessCallback != nil {
            self.didReceiveSuccessCallback!(response as! JokesRootResponse)
        }
    }
    
    private func handleFailedAPIRequest(error : Error!) -> Void {
        if self.didRecieveErrorCallback != nil {
            self.didRecieveErrorCallback!(error)
        }
    }
    
}
