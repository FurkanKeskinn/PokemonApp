//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var nameText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
