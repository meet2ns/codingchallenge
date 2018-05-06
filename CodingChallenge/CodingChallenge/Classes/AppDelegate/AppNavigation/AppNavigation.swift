//
//  AppNavigation.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate{
    
    
    func moveToSelectUserNameView() -> Void {
        let navigationController : UINavigationController = UINavigationController(rootViewController: SelectNameController(nibName: "SelectNameController", bundle: nil))
        window?.rootViewController = navigationController
    }
    
    func showAlert(title: String, message: String) {
        let myAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.window?.rootViewController?.present(myAlert, animated: true, completion: nil)
    }
}

