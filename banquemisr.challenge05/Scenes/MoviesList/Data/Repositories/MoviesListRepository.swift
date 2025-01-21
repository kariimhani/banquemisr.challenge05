//
//  MoviesListRepository.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

final class MoviesListRepository: MoviesListRepositoryContract {
    private let local: MoviesListLocalServiceContract
    private let remote: MoviesListRemoteServiceContract
    
    init(
        local: MoviesListLocalServiceContract = MoviesListLocalService(),
        remote: MoviesListRemoteServiceContract = MoviesListRemoteService()
    ) {
        self.local = local
        self.remote = remote
    }
    
    func getMovies(by category: MovieCategory) -> AnyPublisher<[MovieResponse], BaseError> {
        let localPublisher = local.fetchMovies(by: category.rawValue)
            .map(\.results)
        
        let remotePublisher = remote.fetchMovies(by: category.rawValue)
            .map(\.results)
            .handleEvents(receiveOutput: { [weak self] movies in
                self?.local.save(movies: movies, for: category.rawValue)
            })
            .eraseToAnyPublisher()
        
        
        return localPublisher
            .flatMap {
                return remotePublisher
                    .prepend($0)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
