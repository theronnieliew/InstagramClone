//
//  FriendSearchTableViewCell.swift
//  InstagramClone
//
//  Created by Students on 11/17/16.
//  Copyright © 2016 Panda^4. All rights reserved.
//

import UIKit

class FriendSearchTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
