//
//  MovieDetailUIModel.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

struct MovieDetailUIModel {
    let id: Int
    let title: String
    let backgroundImagePath: String
    let posterImagePath: String
    let duration: String
    let description: String
    
    init(_ movie: MovieDetailResponse) {
        id = movie.id
        posterImagePath = movie.posterPath
        backgroundImagePath = movie.backdropPath
        description = movie.overview
        
        duration = "\(movie.runtime / 60)h \(movie.runtime % 60)m"
        title = [movie.title, movie.releaseDate.formattedDate()]
            .compactMap({ $0 })
            .joined(separator: " ")
    }
}
