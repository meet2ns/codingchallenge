//
//  ListJokesView.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesView: UIView {

    @IBOutlet weak var tableView: UITableView!
    public var listJokesDataSource: ListJokesDatasource!
    
    public func initializeNibsForTableView(){
        self.tableView.register(UINib(nibName: "ListJokesCell", bundle: nil), forCellReuseIdentifier: "ListJokesCell")
    }

}
