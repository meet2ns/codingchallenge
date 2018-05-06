//
//  ListJokesDatasource.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Callbacks
    public var didReceivedSelectedRowActionCallback: ((_ buttonTag: Int) -> Void)?
    
    
    override init() {
        super.init()
    }
    
    override func awakeFromNib() {
    }
    
    //MARK: TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //MARK: TableView Cell Generation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "ListJokesCell"
        
        let cell : ListJokesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ListJokesCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.customGreenColor()
        }
        else{
            cell.backgroundColor = UIColor.white
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let callback = self.didReceivedSelectedRowActionCallback{
            callback(indexPath.row)
        }
    }
    

}
