//
//  AppContainer.swift
//  apiRest
//
//  Created by Juan Manuel on 27/02/2023.
//

protocol AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService { get }
    var localDataService: LocalDataImageService { get }
    func getDataImageUseCase() -> ImageDataUseCase
}

struct AppContainerImp: AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService = ApliClientServiceImp()
    
    var localDataService: LocalDataImageService = LocalDataImageServiceImp()
    
    func getDataImageUseCase() -> ImageDataUseCase {
        let imageDataRepository = ImageDateRepositoryImp(
            remoteDataService: apiClient,
            localDataCache: localDataService)
        return ImageDataUseCaseImp(imageDataRepository: imageDataRepository)
    }
    
    
}
