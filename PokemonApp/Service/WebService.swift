//
//  WebService.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation
class WebService{
    
    func getPokemons(url: URL, completion: @escaping([Pokemon]?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
             let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data)
                print(pokemonList)
                if let pokemonList = pokemonList {
                    completion(pokemonList)
                }
            }
        }.resume()
    }
}
