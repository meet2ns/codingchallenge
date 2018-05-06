//
//  SelectNameController.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class SelectNameController: UIViewController {

    @IBOutlet var selectNameView: SelectNameView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //MARK: Action button for submit
    @IBAction func submitTapped(_ sender: Any) {
        if self.selectNameView.validateFieldsData() == true {
            let listJokesController: ListJokesController = ListJokesController(nibName: ApplicationNibStringConstants.kListJokesController, bundle: nil)
            self.navigationController?.pushViewController(listJokesController, animated: true)
        }
        else{
            AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: ApplicationAlertMessages.kAlertEnterMissingInformation)
        }
    }
}
