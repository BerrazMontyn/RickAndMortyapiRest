//
//  LocationDetailCoordinator.swift
//  apiRest
//
//  Created by Juan Manuel on 02/03/2023.
//
import UIKit

final class LocationDetailCoordinator: Coordinator {
    private var locationDetailFactory: LocationdDetailFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, locationDetailFactory: LocationdDetailFactory) {
        self.navigation = navigation
        self.locationDetailFactory = locationDetailFactory
    }
    
    func start() {
        let controller = locationDetailFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
    
    
}
