//
//  MoviesListLocalService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Combine
import Foundation

final class MoviesListLocalService: MoviesListLocalServiceContract {
    private let controller: DataControllerContract
    
    init(controller: DataControllerContract = DataController()) {
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
                
                let results: [MovieResponse] = try self.controller
                    .fetch(request)
                    .map { .init($0) }
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
                $0.setData(movie, category: category)
            }
        }
        
        controller.save()
    }
}

private extension MovieResponse {
    init(_ movie: Movie) {
        self.init(
            id: Int(movie.id),
            title: movie.title,
            overview: movie.overview,
            voteCount: movie.voteCount,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            backdropPath: movie.backdropPath
        )
    }
}

private extension Movie {
    func setData(
        _ movie: MovieResponse,
        category: String
    ) {
        id = Int64(movie.id)
        title = movie.title
        overview = movie.overview
        voteCount = movie.voteCount
        posterPath = movie.posterPath
        releaseDate = movie.releaseDate
        voteAverage = movie.voteAverage
        backdropPath = movie.backdropPath
        type = category
    }
}
