//
//  MovieCategory.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

enum MovieCategory: String {
    case playing = "now_playing"
    case popular = "popular"
    case upcoming = "upcoming"
}

extension MovieCategory {
    var title: String {
        switch self {
        case .playing: return Constants.TabBar.NowPlaying.title
        case .popular: return Constants.TabBar.Popular.title
        case .upcoming: return Constants.TabBar.Upcoming.title
        }
    }
}
