//
//  ApplicationNavigationBar.swift
//  Lung Direct
//
//  Created by Onebyte LLC on 6/30/17.
//  Copyright © 2017 Onebyte LLC. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func configureTitleView() -> Void {
        var titleView : UIImageView
        titleView = UIImageView(frame:CGRect(x: 0, y: 0, width: CGFloat(ApplicationNumberConstants.kNavigationTitleImageWidth), height: CGFloat(ApplicationNumberConstants.kNavigationTitleImageHeight)))
        
        titleView.contentMode = .scaleAspectFit
        titleView.image = UIImage(named: ApplicationImageFilenames.kNavigationTitleImage)
        
        titleView.layer.zPosition = 1
        
        self.titleView = titleView
    }
}
