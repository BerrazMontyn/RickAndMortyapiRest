//
//  ImageDateRepository.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

import Foundation

protocol ImageDateRepository {
    func fetchData(url: URL?) async -> Data?
    func getFromCache(url: String?) -> Data?
}
