//
//  StatusCharacter.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

enum StatusCharacter: String {
    case alive
    case dead
    case unknown
    
    init?(status: String?) {
        guard let status = StatusCharacter(rawValue: status?.lowercased() ?? .empty)
        else{
            return nil
        }
        self = status
    }
}
extension StatusCharacter: CustomStringConvertible {
    var description: String {
        switch self {
            
        case .alive:
        return AppLocalized.statusAlive
        case .dead:
        return AppLocalized.statusDead
        case .unknown:
        return AppLocalized.statusUnknown
        }
    }
    
    
}
