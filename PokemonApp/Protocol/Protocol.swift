//
//  Protocol.swift
//  PokemonApp
//
//  Created by Furkan on 22.03.2023.
//

import Foundation

protocol ApiServicePokemonProtocol{
func getPokemons(completion: @escaping (Result<[Pokemons.Pokemon], WebService.NetworkError>) -> Void)
}
protocol PokemonsViewModelProtocol{
func getPokemonsViewModel()
var servicePokemon : ApiServicePokemonProtocol {get}
var bindPokemonData : PokemonData? {get}
func Delegates(delegate : PokemonData)
}
protocol PokemonData {
func getDataPokemons(data : [Pokemons.Pokemon])
}

protocol DetailApiServicePokemonProtocol{
func getPokemonsDetail(stringURL: String, completion: @escaping (PokemonDetails) -> Void)
}
protocol DetailPokemonViewModelProtocol{
    var bindPokemonDetailData : DetailPokemonData? {get}
    var serviceDetailPokemon : DetailApiServicePokemonProtocol {get}
    func getDetailPokemon(url: String)
    func DelegateDetail(delegate : DetailPokemonData)
}
protocol DetailPokemonData{
    func detailData(name: String, abilities: [PokemonDetails.Ability], sprites:     String)
}
