//
//  HomeCoordinator.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//


import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory){
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModel(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        //TODO: Use a enum or a struct to avoid string directly
        switch model.title {
        case "characters":
            goToCharacters(urlList: model.url)
        case "episodes":
            goToEpisodes(urlEpisodes: model.url)
        case "locations":
            goToLocations(urlLocation: model.url)
        default:
            break
        }
    }
    
    private func goToCharacters(urlList: String) {
        let characterCoordinator =  homeFactory.makeCharactersCoordinator(
            navigation: navigation,
            urlList: urlList)
        characterCoordinator.start()
    }
    
    private func goToLocations(urlLocation: String) {
        let locationsCoordinator = homeFactory.makeLocationCoordinator(
            navigation: navigation,
            urlLocations: urlLocation)
        locationsCoordinator.start()
    }
    
    private func goToEpisodes(urlEpisodes: String) {
        let episodesCoordinator = homeFactory.makeEpisodesCoordinator(
            navigation: navigation,
            urlEpisodes: urlEpisodes)
        episodesCoordinator.start()
    }
}
