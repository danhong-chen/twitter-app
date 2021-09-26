//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Vivian Chen on 9/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var TweetContent: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
