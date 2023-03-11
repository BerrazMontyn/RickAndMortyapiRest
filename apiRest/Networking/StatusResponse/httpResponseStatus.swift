//
//  httpResponseStatus.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
