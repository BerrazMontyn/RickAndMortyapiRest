//
//  RemoteImageDataService.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

import Foundation

protocol RemoteImageDataService{
    func request(url: URL?) async -> Data?
}
