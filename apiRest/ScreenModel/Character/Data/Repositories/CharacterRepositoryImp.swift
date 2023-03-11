//
//  CharacterRepositoryImp.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//
import Foundation

struct CharacterRepositoryImp: CharactersRepository {
    let apiClient: ApiClientService
    
    func fetchCharacter(urlList: String) async throws -> (info: Info, character: [Character]) {
        let url = URL(string: urlList)
        return try await apiClient.request(url: url, type: ResultsCharactersDTO.self).toDomain()
    }
    
    
}
