//
//  GetMoviesByCategoryUseCase.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

final class GetMoviesByCategoryUseCase: GetMoviesByCategoryUseCaseContract {
    private let repository: MoviesListRepositoryContract
    
    init(repository: MoviesListRepositoryContract = MoviesListRepository()) {
        self.repository = repository
    }
    
    func execute(using category: MovieCategory) -> AnyPublisher<[MovieUIModel], BaseError> {
        repository
            .getMovies(by: category)
            .map { movies in
                movies.map { MovieUIModel(movie: $0) }
            }
            .eraseToAnyPublisher()
    }
}
