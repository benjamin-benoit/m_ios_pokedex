//
//  RequestManager.swift
//  m_ios_pokedex
//
//  Created by Benjamin BENOIT on 15/04/2019.
//  Copyright © 2019 Benjamin BENOIT. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    static func getPokedex(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request("https://pokeapi.co/api/v2/pokedex/2").responseData {
            (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
    
    static func getPokemon(pokeUrl url: String, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request(url).responseData {
            (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}
