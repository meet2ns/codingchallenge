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
        if AppDelegate.sharedInstance()?.jokesArray.count==0 || AppDelegate.sharedInstance()?.jokesArray == nil{
            return 0
        }
        else{
            return (AppDelegate.sharedInstance()?.jokesArray.count)!
        }
    }
    
    //MARK: TableView Cell Generation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "ListJokesCell"
        let cell : ListJokesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ListJokesCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.configureJokeDescription(jokeDescription: AppDelegate.sharedInstance()?.jokesArray[indexPath.row] as! JokesRootResponse)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let callback = self.didReceivedSelectedRowActionCallback{
            callback(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

}
