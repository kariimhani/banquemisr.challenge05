//
//  MovieDetailResponse.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

struct MovieDetailResponse: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let backdropPath: String
    let runtime: Int
    let releaseDate: String
    let originalLanguage: String
    let overview: String

    enum CodingKeys: String, CodingKey {
        case id, title,
             runtime, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
    }
}
