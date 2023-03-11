//
//  AppCoordinator.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//

import UIKit



final class AppCoordinator : Coordinator {
    var navigation: UINavigationController
    private let appFactory : AppFactory
    private var homeCoordinator: Coordinator?
    
    
    init(navigation: UINavigationController, appFactory : AppFactory, window : UIWindow?){
        self.navigation = navigation
        self.appFactory = appFactory
        configureWindows(window: window)
        
        
    }
    //el componente AppCoordinator va a llamar a la funcion start
    // a su vez la funcion start va a llamar a let coordinator, que a travez del appFactory.makeHomeCoordinator
    //crea la pantalla pirncipal del home
    func start() {
        homeCoordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        homeCoordinator?.start()
        
    }
    private func configureWindows(window: UIWindow?){
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
    }

}

