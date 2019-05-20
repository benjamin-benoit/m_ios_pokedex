//
//  PokemonCell.swift
//  m_ios_pokedex
//
//  Created by Benjamin BENOIT on 16/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var entryLabel:UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    func configure(withPokemon pokemon: Pokemon?){
        entryLabel.text = "\(pokemon?.entry_number ?? 0)"
        nameLabel.text = pokemon?.pokemonSpecies.name
    }

}
