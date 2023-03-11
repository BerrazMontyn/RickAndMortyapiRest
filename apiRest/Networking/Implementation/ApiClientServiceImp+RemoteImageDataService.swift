//
//  ApiClientServiceImp+RemoteImageDataService.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

import Foundation

//Download Image.
extension ApliClientServiceImp: RemoteImageDataService{
    func request(url: URL?) async -> Data? {
        guard let url = url else { return nil }
        do{
            let (data: data, request: request) = try await session.data(from: url)
            return (data: data, request: request).data
        } catch {
            return nil
        }
    }
    
    
}
