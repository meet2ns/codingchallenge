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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configureDataSource()
        self.handleSelectedRowCallback()
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

}
