//
//  ApiClientService.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//

import Foundation

protocol ApiClientService {
    func request <T: Decodable>(url : URL?, type: T.Type ) async throws -> T
}
