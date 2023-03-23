//
//  ViewController.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource, PokemonData {
    
    var allPokemon = [Pokemons.Pokemon]()
    var viewModel : PokemonsViewModelProtocol = PokemonListViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getPokemonsViewModel()
        viewModel.Delegates(delegate: self)
        
    }
    
    func getDataPokemons(data: [Pokemons.Pokemon]) {
        self.allPokemon = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPokemon.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.getData(url: allPokemon[indexPath.row].url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailsController.url = allPokemon[indexPath.row].url
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }


}

