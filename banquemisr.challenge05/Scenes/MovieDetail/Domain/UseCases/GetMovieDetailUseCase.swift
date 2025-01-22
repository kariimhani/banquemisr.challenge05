//
//  GetMovieDetailUseCase.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

final class GetMovieDetailUseCase: GetMovieDetailUseCaseContract {
    private let repository: MovieDetailRepositoryContract
    
    init(repository: MovieDetailRepositoryContract = MovieDetailRepository()) {
        self.repository = repository
    }
    
    func execute(using id: Int) -> AnyPublisher<MovieDetailUIModel, BaseError> {
        repository
            .getMovie(by: id)
            .map { .init($0) }
            .eraseToAnyPublisher()
    }
}
