//
//  CharacterDetailRepository.swift
//  apiRest
//
//  Created by Juan Manuel on 28/02/2023.
//

protocol CharacterDetailRepository {
    func fetchCharacterDetail(urlDetail: String) async throws -> Character
}
