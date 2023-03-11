//
//  ItemHomeMenuViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//


struct ItemHomeMenuViewModel {
    
    private let menuItem : MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title : String {
        menuItem.title.capitalized
    }
    var imageName : String {
        menuItem.title
    }
    
}
