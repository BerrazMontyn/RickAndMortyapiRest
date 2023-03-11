//
//  ApiError.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//
import Foundation


enum ApiError : Error {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
}


extension ApiError : LocalizedError{
    
    public var errorDescription : String? {
        switch self {
        case .clientError:
            return NSLocalizedString("Client Error", comment: "")
        case .serverError:
            return NSLocalizedString("Server Error", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown Error", comment: "")
        case .errorInUrl:
            return NSLocalizedString("Error in URL", comment: "")
        case .errorDecoding:
            return NSLocalizedString("Coding Error", comment: "")
        }
    }
}
