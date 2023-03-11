//
//  EpisodeDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 08/03/2023.
//

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
}

