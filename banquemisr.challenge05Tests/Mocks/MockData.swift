//
//  MockData.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

@testable import banquemisr_challenge05
import CoreData

enum MockData {
    static let moviesResponse: MoviesResponse = .init(
            results: [
                .init(
                    id: 1,
                    title: "Title",
                    overview: "Overview",
                    voteCount: 1,
                    posterPath: "Poster",
                    releaseDate: "Date",
                    voteAverage: 5.0,
                    backdropPath: "Backdrop"
                )
            ]
    )
    static let moviesUI: [MovieUIModel] = moviesResponse
        .results
        .map({ .init(movie: $0) })
    
    static let movieDetailResponse: MovieDetailResponse = .init(
        id: 1,
        title: "Title",
        posterPath: "Poster",
        backdropPath: "Backdrop",
        runtime: 100,
        releaseDate: "Release Date",
        originalLanguage: "Language",
        overview: "Overview"
    )
    static let movieDetailUI: MovieDetailUIModel = .init(movieDetailResponse)
    
    static var movie: Movie {
        let entity = Movie(context: TestCoreDataStack.shared.viewContext)
        entity.id = Int64(123456)
        entity.title = "title"
        entity.voteCount = 500
        entity.overview = "overview"
        entity.posterPath = "posterPath"
        entity.releaseDate = "releaseDate"
        entity.voteAverage = 5.0
        entity.backdropPath = "backdropPath"
        entity.type = "type"
        
        return entity
    }
    
    static var movieDetail: MovieDetail {
        let entity = MovieDetail(context: TestCoreDataStack.shared.viewContext)
        entity.id = Int64(123456)
        entity.title = "title"
        entity.overview = "overview"
        entity.posterPath = "posterPath"
        entity.releaseDate = "releaseDate"
        entity.runtime = Int64(94)
        entity.backdropPath = "backdropPath"
        entity.originalLanguage = "originalLanguage"
        
        return entity
    }
}
