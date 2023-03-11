//
//  ImageDataUseCase.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

import Foundation

protocol ImageDataUseCase {
    func getData(url: URL?) async -> Data?
    func getDataFromCache(url: String?) -> Data?
}

struct ImageDataUseCaseImp: ImageDataUseCase {
    private(set) var imageDataRepository: ImageDateRepository
    
    func getData(url: URL?) async -> Data? {
       await imageDataRepository.fetchData(url: url)
    }
    
    func getDataFromCache(url: String?) -> Data? {
        imageDataRepository.getFromCache(url: url)
    }
    
    
}
