//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation
import UIKit

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
    let name: String
    let sprites: Sprites

    struct Ability: Decodable {
        let ability: Species
        
        struct Species: Decodable {
            let name: String
            let url : String
        }
    }
    struct Sprites : Decodable {
        let front_default : String

        }
}
