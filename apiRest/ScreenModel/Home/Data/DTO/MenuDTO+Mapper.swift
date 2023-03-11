//
//  MenuDTO+Mapper.swift
//  apiRest
//
//  Created by Juan Manuel on 21/02/2023.
//

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map{ dictionary in
            let title = dictionary.key
            let url : String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
