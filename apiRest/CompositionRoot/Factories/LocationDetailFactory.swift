//
//  LocationdDetailFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 02/03/2023.
//

import UIKit

protocol LocationdDetailFactory {
    func makeModule() -> UIViewController
}

struct LocationDetailFactoryImp: LocationdDetailFactory {
    func makeModule() -> UIViewController {
        let controler = LocationDetailViewController()
        controler.title = "Location detail"
        return controler
    }
    
    
}
