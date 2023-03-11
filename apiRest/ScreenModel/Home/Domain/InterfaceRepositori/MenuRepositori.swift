//
//  MenuRepositori.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//


protocol MenuRepositori {
    func fetchMenuData()  async throws -> [MenuItem] //cada objeto de este array va a ser un modelo con el nombre de la imagen
}
