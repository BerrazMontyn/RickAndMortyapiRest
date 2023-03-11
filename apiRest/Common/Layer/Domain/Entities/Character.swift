//
//  Character.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

struct Character {
    let id: Int
    let name: String
    let status: StatusCharacter?
    let specie: Specie
    let urlCharacter: String
    let urlImage: String?
    let origin: Origin
    let location: Location
}
