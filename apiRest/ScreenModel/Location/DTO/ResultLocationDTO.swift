//
//  ResultLocationDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

struct ResultLocationDTO: Decodable {
    let info: InfoDTO
    let results: [LocationDTO]
}
