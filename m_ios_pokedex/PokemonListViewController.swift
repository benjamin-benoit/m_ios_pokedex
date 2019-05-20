//
//  ViewController.swift
//  m_ios_pokedex
//
//  Created by Benjamin BENOIT on 15/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource {
    
    var selectedIndexPath: NSIndexPath = NSIndexPath()
    @IBOutlet weak  var tableView: UITableView!
    var pokedex: Pokedex?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        fetchPokedex()
//        parse(jsonString: json)
    }
    
    private func fetchPokedex() {
        RequestManager.getPokedex(success: { data in
            let decoder = JSONDecoder()
            self.pokedex = try? decoder.decode(Pokedex.self, from: data)
            self.tableView.reloadData()
        }) { error in
            print(error)
        }
    }
    
//    func parse(jsonString: String) {
//        if let data = jsonString.data(using: .utf8) {
//            let decoder = JSONDecoder()
//            let user = try! decoder.decode(Pokedex.self, from: data)
//            print(user)
//        } else {
//            print("Could'nt generate datas")
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex?.pokemonEntries.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell_ID", for: indexPath) as? PokemonCell {
            cell.configure(withPokemon: pokedex?.pokemonEntries[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.selectedIndexPath = indexPath
//        self.performSegue(withIdentifier: "PokemonDetailsSegue", sender: self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "PokemonDetailsSegue") {
            if let pokemonDetailsViewController =  segue.destination as? PokemonDetailsViewController, let indexPathSelected = tableView.indexPathForSelectedRow {
                pokemonDetailsViewController.pokemonUrl = String(pokedex?.pokemonEntries[indexPathSelected.row].pokemonSpecies.url ?? "")
                tableView.deselectRow(at: indexPathSelected, animated: false)
            }
        }
    }
    
    

}
