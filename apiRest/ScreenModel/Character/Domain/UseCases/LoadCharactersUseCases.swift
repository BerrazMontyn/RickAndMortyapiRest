//
//  LoadCharactersUseCases.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

protocol LoadCharactersUseCases {
    func execute() async -> Result<[Character], Error>
}
final class LoadCharactersUseCasesImp: LoadCharactersUseCases{
    
    private let characterRepository: CharactersRepository
    private var url: String
    private var result: (info: Info, character: [Character])?
    
    init(characterRepository: CharactersRepository, url: String) {
        self.characterRepository = characterRepository
        self.url = url
    }
    
    func execute() async -> Result<[Character], Error> {
        guard !url.isEmpty else { return.success([]) }
        do{
            let repositoryResult = try await characterRepository.fetchCharacter(urlList: url)
            url = repositoryResult.info.next ?? .empty
            return .success(repositoryResult.character)
            
        }catch {
            return .failure(error)
        }
    }
    
}
