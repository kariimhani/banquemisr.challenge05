//
//  MovieDetailLocalService.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine
import Foundation

final class MovieDetailLocalService: MovieDetailLocalServiceContract {
    private let controller: DataControllerContract
    
    init(controller: DataControllerContract = DataController()) {
        self.controller = controller
    }
    
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse?, BaseError> {
        Future<MovieDetailResponse?, BaseError> { [weak self] promise in
            guard let self else {
                promise(.failure(.unexpected))
                return
            }
            
            do {
                let request = MovieDetail.fetchRequest()
                request.predicate = NSPredicate(format: "id == %@", String(id))
                
                let result: MovieDetailResponse? = try self.controller
                    .fetch(request)
                    .map { .init($0) }
                
                promise(.success(result))
            } catch {
                promise(.failure(.unexpected))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(movie: MovieDetailResponse) {
        controller.insert(MovieDetail.self) {
            $0.setData(movie)
        }
        
        controller.save()
    }
}

private extension MovieDetailResponse {
    init(_ movie: MovieDetail) {
        self.init(
            id: Int(movie.id),
            title: movie.title,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            runtime: Int(movie.runtime),
            releaseDate: movie.releaseDate,
            originalLanguage: movie.originalLanguage,
            overview: movie.overview
        )
    }
}

private extension MovieDetail {
    func setData(_ movie: MovieDetailResponse) {
        id = Int64(movie.id)
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        runtime = Int64(movie.runtime)
        releaseDate = movie.releaseDate
        originalLanguage = movie.originalLanguage
        overview = movie.overview
    }
}
