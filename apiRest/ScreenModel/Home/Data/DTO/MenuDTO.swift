//
//  MenuDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//

struct MenuDTO : Decodable {
    let characters : String
    let locations : String
    let episodes: String
}

extension MenuDTO : PropertyIterator { }
