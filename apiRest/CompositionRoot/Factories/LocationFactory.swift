//
//  LocationFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

import UIKit
import Combine

protocol LocationFactory {
    func makeModule() -> UIViewController
}

struct LocationFactoryImp: LocationFactory {
    private(set) var urlLocations: String
    private(set) var appContainer: AppContainer
  
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let locationsRepository = LocationRepositoryImp(remoteService: appContainer.apiClient)
        let loadLocationUseCase = LoadLocationUseCaseImp(locationsRepository: locationsRepository, urlLocation: urlLocations)
        let lastPageUseCase = LastPageValidationUseCaseImp()
        let viewModel = LocationViewModelImp(
            state: state,
            loadLocationUseCase: loadLocationUseCase,
            lastPageUseCase: lastPageUseCase)
        let controller = LocationsViewController(viewModel: viewModel)
        controller.title = AppLocalized.location
        return controller
    }
    
    
}
