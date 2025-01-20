//
//  Movies.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

struct Movies: Codable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable {
    let id: Int
    let video: Bool
    let adult: Bool
    let title: String
    let voteCount: Int
    let genreIds: [Int]
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let backdropPath: String
    let originalTitle: String
    let originalLanguage: String

    enum CodingKeys: String, CodingKey {
        case id, video,
             adult, title,
             overview, popularity
        case genreIds = "genre_ids"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
    }
}
