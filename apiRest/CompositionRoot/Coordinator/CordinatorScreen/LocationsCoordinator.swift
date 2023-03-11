//
//  LocationsCoordinator.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

import UIKit

final class LocationsCoordinator: Coordinator {
    private let locationFactory: LocationFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, locationFactory: LocationFactory) {
        self.navigation = navigation
        self.locationFactory = locationFactory
    }
    
    func start() {
        let coordinator = locationFactory.makeModule()
        navigation.pushViewController(coordinator, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
    
    
}
