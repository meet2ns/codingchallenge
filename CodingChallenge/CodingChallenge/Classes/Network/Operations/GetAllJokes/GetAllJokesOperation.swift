//
//  GetAllJokesOperation.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit
import SwiftyJSON
class GetAllJokesOperation: OnebyteNetworkOperationBase {

    //MARK: Instance Variables
    var firstName: String?
    var lastName: String?
    
    
    //MARK: Overridden Methods
    override func start() {
        super.start()
        
        self.startFetchingAllFacilitiesOperation()
    }
    
    override func handleDidFinishedWithResponse(response: AnyObject!) {
//        let facilityBaseObject: RootFacilitiesResponse = RootFacilitiesResponse(json: JSON(response))
//
//        self.safeCallDidFinishSuccessfullyCallback(responseObject: facilityBaseObject)
        self.handleDidFinishedCommon()
    }
    
    override func handleDidFinishedWithError(error: Error!) {
        self.safeCallDidFinishWithErrorCallback(error: error)
    }
    
    //MARK: Request
    private func startFetchingAllFacilitiesOperation() {
        
        OnebyteNetworkSessionManager.request(AppNetworkManager.openNetworkRequest(methodType: .get, path: AppNetworkEndPoints.kGetAllRandomJokes, parameters: self.createBody())).responseJSON {response in
            switch response.result {
            case .success(let data):
                self.handleDidFinishedWithResponse(response: data as AnyObject?)
                break
            case .failure(let error):
                self.handleDidFinishedWithError(error: error)
                break
            }
        }
    }
    
    private func createBody() -> Dictionary<String, Any>{
        return [
            "firstName": self.firstName!,
            "lastName": self.lastName!
        ]
    }
    
}
