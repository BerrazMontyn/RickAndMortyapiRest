//
//  LocationDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

struct LocationDTO: Decodable {
    let name: String
    let type: String?
    let dimension: String?
    let url: String
}
