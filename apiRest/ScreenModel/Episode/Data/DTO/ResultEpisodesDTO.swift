//
//  ResultEpisodesDTO.swift
//  apiRest
//
//  Created by Juan Manuel on 08/03/2023.
//


struct ResultEpisodesDTO: Decodable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
