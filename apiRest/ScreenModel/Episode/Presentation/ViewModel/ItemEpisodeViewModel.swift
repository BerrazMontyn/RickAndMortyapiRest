//
//  ItemEpisodeViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 09/03/2023.
//


struct ItemEpisodeViewModel {
    private(set) var episode: Episode
    
    var numberEpisode: String {
        "# \(episode.id)"
    }
    
    var name: String {
        episode.name
    }
    
    var airDate: String {
        episode.airDate
    }
    
    var seasonAndEpisode: String {
        episode.episode
    }
}
