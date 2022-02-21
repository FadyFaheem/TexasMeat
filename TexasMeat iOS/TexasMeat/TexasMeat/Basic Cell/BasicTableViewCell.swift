//
//  BasicTableViewCell.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/17/22.
//

import UIKit

class BasicTableViewCell: UITableViewCell {


    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var basicImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
