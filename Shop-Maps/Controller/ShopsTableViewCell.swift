//
//  ShopsTableViewCell.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 27/3/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class ShopsTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
