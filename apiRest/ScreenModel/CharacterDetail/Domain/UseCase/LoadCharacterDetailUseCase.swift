//
//  LoadCharacterDetailUseCase.swift
//  apiRest
//
//  Created by Juan Manuel on 28/02/2023.
//

protocol LoadCharacterDetailUseCase {
    func execute() async throws -> Character
}

struct LoadCharacterDetailUseCaseImp: LoadCharacterDetailUseCase {
    private(set) var characterDetailRepository: CharacterDetailRepository
    private(set) var urlDetail: String
    
    
    func execute() async throws -> Character {
        try await characterDetailRepository.fetchCharacterDetail(urlDetail: urlDetail)
    }
}
