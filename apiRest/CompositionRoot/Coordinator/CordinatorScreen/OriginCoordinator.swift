//
//  OriginCoordinator.swift
//  apiRest
//
//  Created by Juan Manuel on 02/03/2023.
//

import UIKit

final class OriginCoordinator: Coordinator {
    private var originFactory: OriginFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, originFactory: OriginFactory) {
        self.navigation = navigation
        self.originFactory = originFactory
    }
    
    func start() {
        let controller = originFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
    
    
}
