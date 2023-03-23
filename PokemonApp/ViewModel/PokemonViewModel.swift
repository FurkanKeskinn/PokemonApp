//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation

class PokemonListViewModel: PokemonsViewModelProtocol{
    
    
   lazy var servicePokemon: ApiServicePokemonProtocol = WebService()
    var bindPokemonData: PokemonData?
    
    init() {
        self.servicePokemon = WebService()
    }
    
    func getPokemonsViewModel(){
        servicePokemon.getPokemons{ result in
            switch result {
            case .success(let pokemonList) :
                self.bindPokemonData?.getDataPokemons(data: pokemonList)
            case .failure(let error):
                print(error)
            }
        }
    }
    func Delegates(delegate: PokemonData) {
        self.bindPokemonData = delegate
    }
    
}
class PokemonViewModel : DetailPokemonViewModelProtocol{
    
    var bindPokemonDetailData: DetailPokemonData?
    var serviceDetailPokemon: DetailApiServicePokemonProtocol = WebService()
    
    init() {
        serviceDetailPokemon = WebService()
    }
    
    func DelegateDetail(delegate: DetailPokemonData) {
        self.bindPokemonDetailData = delegate
    }
    
    func getDetailPokemon(url: String) {
        serviceDetailPokemon.getPokemonsDetail(stringURL: url) { result in
            self.bindPokemonDetailData?.detailData(name: result.name, abilities: result.abilities, sprites: result.sprites.front_default)
        }
    }
    
    
}
