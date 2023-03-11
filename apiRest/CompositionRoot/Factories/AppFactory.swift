//
//  AppFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator (navigation: UINavigationController) -> Coordinator //retorna coordinator del home.
}

struct implementacionDeAppFactory : AppFactory {
    
    let appContainer = AppContainerImp()
    //Conformar protocolo
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        
        let homeFactory = ImplementacionHomeFactory(appContainer: appContainer)
        let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
        return homeCoordinator
        
        

    
    }
    
    
}
