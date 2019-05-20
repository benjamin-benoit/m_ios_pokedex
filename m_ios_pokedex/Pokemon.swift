//
//  Pokemon.swift
//  m_ios_pokedex
//
//  Created by Benjamin BENOIT on 15/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    enum CodingKeys: String, CodingKey {
        case entry_number
        case pokemonSpecies = "pokemon_species"
    }
    
    struct PokemonSpecies : Codable {
        var name: String
        var url: String
    }
    
    var entry_number: Int
    var pokemonSpecies: PokemonSpecies
}
