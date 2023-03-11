//
//  HomeFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModel(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
    
    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String) -> Coordinator
   
    func makeLocationCoordinator(
        navigation: UINavigationController,
        urlLocations: String) -> Coordinator
    
    func makeEpisodesCoordinator(
        navigation: UINavigationController,
        urlEpisodes: String) -> Coordinator
}

struct ImplementacionHomeFactory : HomeFactory {
   
    let appContainer: AppContainer
    
    func makeModel(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
        let apiClientService = ApliClientServiceImp()
        
        let menuRepository = MenuRepositoriesImp(apiClientService: apiClientService, urlList:Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase:
                                                        loadMenuUseCase)
        let homeMenuController = Homecontroller(
            viewModel: homeMenuViewModel,
            layaout: makeLayout(), coordinator: coordinator)
        homeMenuController.title = AppLocalized.apaName
        return homeMenuController
    }
    
    
    private func makeLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePading) / ViewValues.multiplayerTwo
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePading) / ViewValues.multiplayerTwo
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: ViewValues.normalPading, bottom: .zero, right: ViewValues.normalPading)
        return layout
        
    }
    func makeCharactersCoordinator(navigation: UINavigationController, urlList: String) ->
        Coordinator {
        let charactersFactory = CharactersFactoryImp(
            urlList: urlList,
            appContainer: appContainer)
        let characterCoordinator = CharactersCoordinator(navigation: navigation, charactersFactory: charactersFactory)
            return characterCoordinator
    }
    
    func makeLocationCoordinator(navigation: UINavigationController, urlLocations: String) -> Coordinator {
        let locationFactory = LocationFactoryImp(
            urlLocations: urlLocations, appContainer: appContainer)
        let locationsCoordinator = LocationsCoordinator(
            navigation: navigation,
            locationFactory: locationFactory)
        return locationsCoordinator
    }
    
    func makeEpisodesCoordinator(navigation: UINavigationController, urlEpisodes: String) -> Coordinator {
        let espisodesFactory = EpisodesFactoryImp(
            urlEpisodes: urlEpisodes, appContainer: appContainer)
        let episodesCoordinator = EpisodesCoordinator(
            episodesFactory: espisodesFactory, navigation: navigation)
        return episodesCoordinator
    }
    
}
    
    
