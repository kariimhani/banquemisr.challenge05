//
//  MovieUIModel.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Foundation

struct MovieUIModel {
    let id: Int
    let title: String
    let imagePath: String
    let rating: String
    let ratingCount: String
    
    init(
        movie: MovieResponse
    ) {
        id = movie.id
        imagePath = movie.posterPath
        ratingCount = "(\(movie.voteCount))"
        rating = "\(String(format: "%.2f", movie.voteAverage))"
        title = [movie.title, movie.releaseDate.formattedDate()]
            .compactMap({ $0 })
            .joined(separator: " ")
    }
}
