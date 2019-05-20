//
//  PokemonDetailsViewController.swift
//  m_ios_pokedex
//
//  Created by Benjamin BENOIT on 15/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var pokemonUrl: String?
    var pokemon: Pokemon?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.text = pokemonUrl
        fetchPokemon() 
        print(pokemon)
        print("ok")
    }
    
    private func fetchPokemon() {
        RequestManager.getPokemon(pokeUrl: pokemonUrl ?? "", success: { data in
            let decoder = JSONDecoder()
            self.pokemon = try? decoder.decode(Pokemon.self, from: data)
        }) { error in
            print(error)
        }
    }
    
    
    
}
