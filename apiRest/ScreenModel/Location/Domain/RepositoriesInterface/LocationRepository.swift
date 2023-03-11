//
//  LocationRepository.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

protocol LocationRepository {
    func fetchLocation( urlLocation: String) async throws -> (info: Info, locations: [Location])
}
