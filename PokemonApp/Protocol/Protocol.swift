//
//  Protocol.swift
//  PokemonApp
//
//  Created by Furkan on 22.03.2023.
//

import Foundation

protocol WEBService{
    func getPokemons(completion: @escaping (Result<[Pokemons.Pokemon], WebService.NetworkError>) -> Void)
    
    
}

protocol ListViewModel{
    func getList()
    
    var listAPI : WEBService {get}
    var listView : ListOut? {get}
    
    
}
protocol ListOut {
    func save(list : [Pokemons.Pokemon])
}
