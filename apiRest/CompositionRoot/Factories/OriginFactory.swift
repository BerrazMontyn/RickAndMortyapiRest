//
//  OriginFactory.swift
//  apiRest
//
//  Created by Juan Manuel on 02/03/2023.
//

import UIKit

protocol OriginFactory {
    func makeModule() -> UIViewController
}

struct OriginFactoryImp: OriginFactory {
    func makeModule() -> UIViewController {
        let controller = OriginViewController()
        controller.title = "Origin"
        return controller
    }
}
