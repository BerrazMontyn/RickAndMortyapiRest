//
//  ImageDateRepositoryImp.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

import Foundation

struct ImageDateRepositoryImp: ImageDateRepository {
    //poniendo un private set, puedo inyectarlos
    private(set) var remoteDataService: RemoteImageDataService
    private(set) var localDataCache: LocalDataImageService
    
    func fetchData(url: URL?) async -> Data? {
        let data = await remoteDataService.request(url: url)
        localDataCache.save(key: url?.absoluteString ?? .empty, data: data)
        return data
    }
    
    func getFromCache(url: String?) -> Data? {
        localDataCache.get(key: url ?? .empty)
    }
    
    
}
