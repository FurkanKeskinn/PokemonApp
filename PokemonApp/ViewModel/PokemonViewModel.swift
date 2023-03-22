//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation

class PokemonListViewModel: ListViewModel{
    
    
   lazy var listAPI: WEBService = WebService()
    var listView: ListOut?
    
    init() {
        self.listAPI = WebService()
    }
    
    func getList(){
        listAPI.getPokemons{ result in
            switch result {
            case .success(let pokemonList) : self.listView?.save(list: pokemonList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
struct PokemonViewModel {
    let pokemonDetail : PokemonDetails
    
    var id : Int {
        return self.pokemonDetail.id
    }
    var name : String {
        return self.pokemonDetail.name
    }
    var image : PokemonDetails.Sprites{
        return self.pokemonDetail.sprites
    }
    var ability : String {
        return self.pokemonDetail.abilities[0].ability.name
    }
}
