//
//  LoadMenuUseCase.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//

protocol LoadMenuUseCase {
    func execute() async -> Result <[MenuItem], Error>
    
}

struct LoadMenuUseCaseImp : LoadMenuUseCase {
    
    let menuRepository : MenuRepositori
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch  {
            
            return .failure(error)
            
        }
    }
    
    
}
