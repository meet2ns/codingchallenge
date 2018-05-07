//
//  ListJokesController.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit
import Reachability

class ListJokesController: UIViewController {

    @IBOutlet var listJokesView: ListJokesView!
    
    var firstName: String!
    var lastName: String!
    
    var count = 0
    
    
    // MARK: Instance Variables
    var handler: ListJokesHandler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configureHandler()

        self.configureNavigationBar()
        self.checkInternetConnectivity()
        
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
    
    //MARK: BAR Buttons
    func configureNavigationBar() -> Void {
        self.title = "Joke's Listing"
        let menuImage : UIImage = UIImage(named: "back")!
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButton(image: menuImage, target: self, action: #selector(backButtonTapped))
        
    }
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Process Internet Connectivity
    func checkInternetConnectivity() -> Void {
        if Reachability()!.connection != .none {
            self.startAnimating()
            self.processRequest(countVal: 0)
        }
        else{
            AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: ApplicationAlertMessages.kAlertInternetNotAvailableTitle)
        }
    }
    
    //MARK: Process Request
    func processRequest(countVal: Int) -> Void {
        if countVal < 10{
            processAPIRequest()
           let newCountVal = self.getCountValueForAPIRequest(currentCount: countVal)
            processRequest(countVal:newCountVal)
        }
        else{
            return
        }
        
    }
    
    fileprivate func getCountValueForAPIRequest(currentCount: Int)-> Int{
        return currentCount+1
    }
    
    fileprivate func processAPIRequest() -> Void {
        DispatchQueue.global(qos: .background).async {
            // Background Thread
            self.handler.requestFetchingJokesAPI(firstName: self.firstName, lastName: self.lastName)
        }
    }
    
    
    //MARK: configure Table DataSource
    func configureDataSource() {
        self.listJokesView.initializeNibsForTableView()
        
        self.listJokesView.tableView.estimatedRowHeight = 44
        self.listJokesView.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.listJokesView.listJokesDataSource = ListJokesDatasource()
        
        self.listJokesView.tableView.dataSource = self.listJokesView.listJokesDataSource
        self.listJokesView.tableView.delegate = self.listJokesView.listJokesDataSource

        self.listJokesView.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
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
    
    private func handleSuccessfulFetchingJokesFRomAPI(jokesObject: JokesRootResponse!) {
        self.stopAnimating()
        AppDelegate.sharedInstance()?.jokesArray.add(jokesObject)
        self.listJokesView.tableView.reloadData()
    }
    
    private func handleErrorHandling(error : Error!) -> Void {
        // Develop category for NSError
        AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: error.localizedDescription)
    }

    private func handleSelectedRowCallback(index: Int) -> Void {
        switch index {
            
        case 0:
            break
            
        default:
            break
            
        }
    }
}
