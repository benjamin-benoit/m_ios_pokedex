//
//  Song.swift
//  m_ios tableview
//
//  Created by Benjamin BENOIT on 09/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case pokemonEntries = "pokemon_entries"
    }
    
//    enum CodingKeys: String, CodingKey {
//        case entry_number
//        case pokemonSpecies = "pokemon_species"
//    }
//
//    struct PokemonSpecies : Codable {
//        var name: String
//        var url: String
//    }
    
    var pokemonEntries: [Pokemon]
    
}
