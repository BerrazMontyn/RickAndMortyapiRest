//
//  LoadLocationUseCase.swift
//  apiRest
//
//  Created by Juan Manuel on 03/03/2023.
//


protocol LoadLocationUseCase {
    mutating func execute() async -> Result<[Location], Error>
}

struct LoadLocationUseCaseImp: LoadLocationUseCase {
    private(set) var locationsRepository: LocationRepository
    private(set) var urlLocation: String
    
    mutating func execute() async -> Result<[Location], Error> {
        guard !urlLocation.isEmpty else {return .success([])}
        
        do{
            let result = try await locationsRepository.fetchLocation(urlLocation: urlLocation)
            urlLocation = result.info.next ?? .empty
            return .success(result.locations)
        } catch {
            return .failure(error)
        }
    }
}
