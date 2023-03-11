//
//  Reusable.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//
protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) } // se retorna un string para que la celda se escriba
    
}
