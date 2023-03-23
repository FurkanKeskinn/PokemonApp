//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var nameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func getData(url: String){
        WebService().getPokemonsDetail(stringURL: url) {
            pokemon in
            DispatchQueue.main.async {
                self.nameText?.text = pokemon.name
                self.imageViewCell?.sd_setImage(with: URL(string: pokemon.sprites.front_default))
            }
        }
    }
}
