//
//  EpisodesRepository.swift
//  apiRest
//
//  Created by Juan Manuel on 08/03/2023.
//

protocol EpisodesRepository {
    func fetch(urlEpisodes: String)
    async throws -> (info: Info, episodes: [Episode])
}
