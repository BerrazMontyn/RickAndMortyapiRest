//
//  MenuRepositoriesImp.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//
import Foundation

struct MenuRepositoriesImp : MenuRepositori {
    
    let apiClientService : ApiClientService
    let urlList : String
    
    
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlList)
       return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
        
    }
}
    
