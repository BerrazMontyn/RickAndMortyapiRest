//
//  CharacterDetailRepositoryImp.swift
//  apiRest
//
//  Created by Juan Manuel on 28/02/2023.
//

import Foundation

struct CharacterDetailRepositoryImp: CharacterDetailRepository {
    private(set) var remoteService: ApiClientService
    
    func fetchCharacterDetail(urlDetail: String) async throws -> Character {
        let url = URL(string: urlDetail)
        let result = try await remoteService.request(url: url, type: CharacterDTO.self)
        return result.toDomain()
    }
    
    
}
