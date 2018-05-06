//
//  ListJokesController.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesController: UIViewController {

    @IBOutlet var listJokesView: ListJokesView!
    
    var firstName: String!
    var lastName: String!
    
    // MARK: Instance Variables
    var handler: ListJokesHandler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configureHandler()
        self.processRequest()
        
        self.configureDataSource()
        self.handleSelectedRowCallback()
        self.configureCallbacks()
    }

    // MARK: Handler
    private func configureHandler() -> Void{
        self.handler = ListJokesHandler(viewController: self)
    }
    
    func processRequest() -> Void {
        self.handler.requestFetchingJokesAPI(firstName: self.firstName, lastName: self.lastName)
    }
    
    
    //MARK: configure DataSource
    func configureDataSource() {
        self.listJokesView.initializeNibsForTableView()
        
        self.listJokesView.tableView.estimatedRowHeight = 70
        self.listJokesView.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.listJokesView.listJokesDataSource = ListJokesDatasource()
        
        self.listJokesView.tableView.dataSource = self.listJokesView.listJokesDataSource
        self.listJokesView.tableView.delegate = self.listJokesView.listJokesDataSource

        self.listJokesView.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
    }
    
    
    func handleSelectedRowCallback() -> Void {
        self.listJokesView.listJokesDataSource.didReceivedSelectedRowActionCallback = { index in
            switch index {
          
            case 0:
                break
                
            default:
                break
                
            }
        }
    }
    
    
    //MARK: Callbacks
    func configureCallbacks() {
        self.handler.didReceiveSuccessCallback = {response in
            self.handleSuccessfulFetchingJokesFRomAPI(jokesObject: response as! JokesRootResponse)
        }
        
        self.handler.didRecieveErrorCallback = {error in
            self.handleErrorHandling(error: error)
        }
    }
    
    func handleSuccessfulFetchingJokesFRomAPI(jokesObject: JokesRootResponse!) {
        self.stopAnimating()
    }
    
    private func handleErrorHandling(error : Error!) -> Void {
        // Develop category for NSError
        AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: error.localizedDescription)
    }

}
