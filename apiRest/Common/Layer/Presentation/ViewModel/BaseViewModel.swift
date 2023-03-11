//
//  BaseViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

import Combine

protocol BaseViewModel {
    var state: PassthroughSubject <StateController, Never> { get }
    func viewDidLoad()
}
