//
//  MoviesListLocalService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Combine
import Foundation

final class MoviesListLocalService: MoviesListLocalServiceContract {
    private let controller: DataController
    
    init(controller: DataController = DataController()) {
        self.controller = controller
    }
    
    func fetchMovies(by category: String) -> AnyPublisher<MoviesResponse, BaseError> {
        Future<MoviesResponse, BaseError> { [weak self] promise in
            guard let self else {
                promise(.failure(.unexpected))
                return
            }
            
            do {
                let request = Movie.fetchRequest()
                request.predicate = NSPredicate(format: "type == %@", category)
                request.sortDescriptors = [.init(key: "id", ascending: true)]
                
                let results = try self.controller
                    .fetch(request)
                    .map { $0.toResponse }
                promise(.success(.init(results: results)))
            } catch {
                promise(.failure(.unexpected))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(movies: [MovieResponse], for category: String) {
        movies.forEach { movie in
            controller.insert(Movie.self) {
                $0.id = Int64(movie.id)
                $0.title = movie.title
                $0.overview = movie.overview
                $0.voteCount = movie.voteCount
                $0.posterPath = movie.posterPath
                $0.releaseDate = movie.releaseDate
                $0.voteAverage = movie.voteAverage
                $0.backdropPath = movie.backdropPath
                $0.type = category
            }
        }
        
        controller.save()
    }
}

private extension Movie {
    var toResponse: MovieResponse {
        .init(
            id: Int(id),
            title: title,
            overview: overview,
            voteCount: voteCount,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            backdropPath: backdropPath
        )
    }
}
