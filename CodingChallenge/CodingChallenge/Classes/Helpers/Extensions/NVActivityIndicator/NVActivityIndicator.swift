//
//  NVActivityIndicator.swift
//  expomobile-swift
//
//  Created by Onebyte LLC on 25/08/2017.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//


import Foundation
import NVActivityIndicatorView

extension UIViewController:NVActivityIndicatorViewable{
    
    public func configureIndicator(){
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "", type: NVActivityIndicatorType(rawValue: 29)!)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("")
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            
        }
    }
}
