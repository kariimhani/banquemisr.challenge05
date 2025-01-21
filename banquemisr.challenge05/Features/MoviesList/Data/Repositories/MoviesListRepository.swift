//
//  MoviesListRepository.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

final class MoviesListRepository: MoviesListRepositoryContract {
    private let service: MoviesListRemoteServiceContract
    
    init(service: MoviesListRemoteServiceContract = MoviesListRemoteService()) {
        self.service = service
    }
    
    func getMovies(by category: MovieCategory) -> AnyPublisher<[MovieResponse], BaseError> {
        service
            .fetchMovies(by: category.rawValue)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
