//
//  ItemLocationViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 04/03/2023.
//

struct ItemLocationViewModel {
    private(set) var location: Location
    
    var name: String {
        location.name
    }
    
    //TODO: - Remove string and use AppLocalized
    var dimension: String{
        let safeDimension = location.dimension ?? AppLocalized.unknown
        return "Dimension: \(safeDimension)"
    }
    
    var type: String {
        let safeType = location.type ?? AppLocalized.unknown
        return "Type: \(safeType)"
    }
}

