//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation
import UIKit

/*struct PokemonList : Decodable{
    let id: Int
    let name: String
    let sprites: Sprites
    
    struct Sprites: Decodable {
        let image: String
       
    }
}

struct PokemonDetail : Decodable{
    let id: Int
    let name: String
    let abilities: [Abilities]
    let sprites: Sprites
    
    struct Abilities: Decodable {
        let ability: Ability
        struct Ability : Decodable{
            let name : String
        }
    }
    
    struct Sprites: Decodable {
        let image: String
       
    }
}*/

struct Pokemons: Decodable {
    let count: Int
    let results: [Pokemon]
    
    struct Pokemon: Decodable {
        let name: String
        let url: String
    }
}
struct PokemonDetails: Decodable {
    let abilities: [Ability]
    let id: Int
    let name: String
    let sprites: Sprites

    struct Ability: Decodable {
        let ability: Species
        
        struct Species: Decodable {
            let name: String
        }
    }
    
    struct Sprites: Decodable {
        let frontDefault: String
    }
}


