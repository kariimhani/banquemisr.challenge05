//
//  MoviesResponse.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

struct MoviesResponse: Decodable {
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}
