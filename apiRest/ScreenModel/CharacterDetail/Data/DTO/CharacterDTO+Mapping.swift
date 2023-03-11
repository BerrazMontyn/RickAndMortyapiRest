//
//  CharacterDTO+Mapping.swift
//  apiRest
//
//  Created by Juan Manuel on 28/02/2023.
//

import Foundation

extension CharacterDTO {
    func toDomain() -> Character {
        let statusCharacter = StatusCharacter(status: status)
        let specie = Specie(specie: species)
        let origin = Origin(name: origin.name, url: origin.url)
        let location = Location(
            name: location.name,
            type: location.type,
            dimension: location.dimension,
            url: location.url)
        return Character(
            id: id,
            name: name,
            status: statusCharacter,
            specie: specie,
            urlCharacter: url,
            urlImage: image,
            origin: origin,
            location: location)
    }
}
