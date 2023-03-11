//
//  ResultsCharactersDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

struct ResultsCharactersDTO: Decodable {
    let results: [CharacterDTO]
    let info: InfoDTO
}
