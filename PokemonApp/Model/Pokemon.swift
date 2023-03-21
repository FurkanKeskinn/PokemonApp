//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Furkan on 21.03.2023.
//

import Foundation
import UIKit

struct Pokemon : Decodable{
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
}
