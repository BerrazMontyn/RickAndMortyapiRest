//
//  CharactersRepository.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

protocol CharactersRepository {
    func fetchCharacter(
        urlList: String) async throws -> (info: Info, character:[Character]) //accedo mediante una tupla
    
}
