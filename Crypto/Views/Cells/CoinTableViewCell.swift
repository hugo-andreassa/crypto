//
//  CoinTableViewCell.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
