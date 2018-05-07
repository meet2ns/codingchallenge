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
        self.selectNameView.configureTextFieldsLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: Action button for submit
    @IBAction func submitTapped(_ sender: Any) {
        if self.selectNameView.validateFieldsData() == true {
            let listJokesController: ListJokesController = ListJokesController(nibName: ApplicationNibStringConstants.kListJokesController, bundle: nil)
            
            listJokesController.firstName = self.selectNameView.firstNameField.text
            listJokesController.lastName = self.selectNameView.lastNameField.text
            
            self.navigationController?.pushViewController(listJokesController, animated: true)
        }
        else{
            AppDelegate.sharedInstance()?.showAlert(title: ApplicationAlertMessages.kAlertTitle, message: ApplicationAlertMessages.kAlertEnterMissingInformation)
        }
    }
}
