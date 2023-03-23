//
//  DetailsController.swift
//  PokemonApp
//
//  Created by Furkan on 22.03.2023.
//

import UIKit

class DetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailPokemonData {
    
    private var viewModel : DetailPokemonViewModelProtocol = PokemonViewModel()
    private var abilities = [PokemonDetails.Ability]()

    @IBOutlet weak var spritesImageView: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var tabelView: UITableView!
    
    static var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        viewModel.DelegateDetail(delegate: self)
        viewModel.getDetailPokemon(url: DetailsController.url!)

    }
    
    func detailData(name: String, abilities: [PokemonDetails.Ability], sprites: String) {
        DispatchQueue.main.async {
            self.nameText.text = name
            self.abilities = abilities
            self.spritesImageView.sd_setImage(with: URL(string: sprites))
            self.tabelView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abilities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = abilities[indexPath.row].ability.name
        cell.textLabel?.textAlignment = .center
        return cell
    }

}
