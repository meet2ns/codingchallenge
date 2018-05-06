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
        self.configureCallbacks()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        AppDelegate.sharedInstance()?.jokesArray.removeAllObjects()
    }
    
    // MARK: Handler
    private func configureHandler() -> Void{
        self.handler = ListJokesHandler(viewController: self)
    }
    
    func processRequest() -> Void {
        
        for  var i in (0..<10){
            DispatchQueue.global(qos: .background).async {
                // Background Thread
                self.handler.requestFetchingJokesAPI(firstName: self.firstName, lastName: self.lastName)

                DispatchQueue.main.async {
                    // Run UI Updates
//                    self.listJokesView.tableView.reloadData()
                }
            }

        }
        
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
    
    
    func handleSelectedRowCallback(index: Int) -> Void {
        switch index {
      
        case 0:
            break
            
        default:
            break
            
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
        
        self.listJokesView.listJokesDataSource.didReceivedSelectedRowActionCallback = { index in
            self.handleSelectedRowCallback(index: index)
        }
    }
    
    func handleSuccessfulFetchingJokesFRomAPI(jokesObject: JokesRootResponse!) {
        self.stopAnimating()
        AppDelegate.sharedInstance()?.jokesArray.add(jokesObject)
        self.listJokesView.tableView.reloadData()
    }
    
    private func handleErrorHandling(error : Error!) -> Void {
        // Develop category for NSError
        AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: error.localizedDescription)
    }

}
