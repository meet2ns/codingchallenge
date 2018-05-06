//
//  ListJokesCell.swift
//  CodingChallenge
//
//  Created by OneByte on 5/6/18.
//  Copyright © 2018 iDevz. All rights reserved.
//

import UIKit

class ListJokesCell: UITableViewCell {

    @IBOutlet weak var jokeDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureJokeDescription(jokeDescription: JokesRootResponse) -> Void {
        self.jokeDescription.text = jokeDescription.value?.joke
    }
    
}
