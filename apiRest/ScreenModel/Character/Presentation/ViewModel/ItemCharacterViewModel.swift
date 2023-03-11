//
//  ItemCharacterViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//
import Foundation

struct ItemCharacterViewModel {
    private(set) var character: Character
    private(set) var dataImageUseCase: ImageDataUseCase
    
    var name: String {
        character.name
    }
    
    var specie: String {
        character.specie.description
    }
    
    var status: String {
        character.status?.description ?? "👾"
    }
    
    var imageData: Data? {
        dataImageUseCase.getDataFromCache(url: character.urlImage)
    }
    
    //TODO: create the URL in the Data layer not in the presentation layer
    func getImageData() async -> Data? {
           let url = URL(string: character.urlImage ?? .empty)
           return await dataImageUseCase.getData(url: url)
       }
}
