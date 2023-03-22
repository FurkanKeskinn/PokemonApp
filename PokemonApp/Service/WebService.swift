//
//  WebService.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation
class WebService: WEBService{
    
    enum NetworkError : Error {
        case invalidURL
        case serverError
        case fetchingError
    }

    
    func getPokemons(completion: @escaping (Result<[Pokemons.Pokemon], NetworkError>) -> Void) {
        
        guard let url = Constants.API.baseAPI else{
            completion(.failure(.invalidURL)); return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.fetchingError));
                return
            }else if let data = data{
             let pokemonList = try? JSONDecoder().decode(Pokemons.self, from: data)
                print(pokemonList)
                if let pokemonList = pokemonList {
                    completion(.success(pokemonList.results))
                }else{
                    completion(.failure(.serverError)); return
                }
            }
        }
        .resume()
    }
}
