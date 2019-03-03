//
//  RecordsTableViewCell.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 19/4/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {

    @IBOutlet weak var english: UILabel!
    
    @IBOutlet weak var german: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
