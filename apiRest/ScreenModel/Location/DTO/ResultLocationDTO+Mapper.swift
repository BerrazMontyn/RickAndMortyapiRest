//
//  ResultLocationDTO+Mapper.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//

extension ResultLocationDTO {
    func toDomain() -> (info: Info, locations: [Location]) {
        let info = Info(next: info.next)
        let locations = results.map {
            Location(
                name: $0.name,
                type: $0.type,
                dimension: $0.dimension,
                url: $0.url)
        }
        return (info: info, locations: locations)
    }
}
