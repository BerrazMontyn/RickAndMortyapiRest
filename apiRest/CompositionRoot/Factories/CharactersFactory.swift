//
//  CharactersFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 24/02/2023.
//

import UIKit
import Combine

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
    func makeCharacterDetailCoordinator(navigation: UINavigationController, urlDetail: String) -> Coordinator
}

struct CharactersFactoryImp: CharactersFactory {
   
    let urlList: String
    let appContainer: AppContainer
    
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = appContainer.apiClient
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharactersUseCase = LoadCharactersUseCasesImp(
            characterRepository: characterRepository,
            url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharactersViewModelImp(
            loadCharactersUseCase: loadCharactersUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase,
            imageDataUseCase: appContainer.getDataImageUseCase())
        let controller = CharactersViewController(
            viewModel: viewModel,
            coordinator: coordinator)
        controller.title = "Characters"
        return controller
        }
    
    func makeCharacterDetailCoordinator(
        navigation: UINavigationController,
        urlDetail: String) ->
    Coordinator {
        let characterDetailFactory = CharacterDetailFactoryImp(urlDetail: urlDetail, appContainer: appContainer)
        let characterDetailCoordinator = CharacterDetailCoordinator(
            navigation: navigation,
            characterDetailFactory: characterDetailFactory)
        return characterDetailCoordinator
    }
}
