//
//  LocationRepositoryImp.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

import Foundation

struct LocationRepositoryImp: LocationRepository {
    private(set) var remoteService: ApiClientService
    
    func fetchLocation(urlLocation: String) async throws -> (info: Info, locations: [Location]) {
        let url = URL(string: urlLocation)
        return try await remoteService.request(url: url, type: ResultLocationDTO.self).toDomain()
    }
    
    
}
