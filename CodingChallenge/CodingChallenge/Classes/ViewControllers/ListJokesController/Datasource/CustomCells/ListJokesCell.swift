//
//  ListJokesCell.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var jokeDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.parentView.addDropShadow(shadowView: self, color: UIColor.black, backgroundColor: UIColor.white, offSet: CGSize.zero)
        self.parentView.layer.cornerRadius = 10.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureJokeDescription(jokeDescription: JokesRootResponse) -> Void {
        let encodedString = jokeDescription.value?.joke
        let decodedString = encodedString?.stringByDecodingHTMLEntities
        self.jokeDescription.text = decodedString
    }
    
}
