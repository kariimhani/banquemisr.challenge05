//
//  MovieDetailRepository.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import Combine

final class MovieDetailRepository: MovieDetailRepositoryContract {
    private let local: MovieDetailLocalServiceContract
    private let remote: MovieDetailRemoteServiceContract
    
    init(
        local: MovieDetailLocalServiceContract = MovieDetailLocalService(),
        remote: MovieDetailRemoteServiceContract = MovieDetailRemoteService()
    ) {
        self.local = local
        self.remote = remote
    }
    
    func getMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError> {
        let localPublisher = local.fetchMovie(by: id)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
        
        let remotePublisher = remote.fetchMovie(by: id)
            .handleEvents(receiveOutput: { [weak self] movie in
                self?.local.save(movie: movie)
            })
            .eraseToAnyPublisher()
        
        
        return localPublisher
            .flatMap { localMovie in
                guard let localMovie
                else {
                    return remotePublisher
                }
                
                return Just(localMovie)
                    .setFailureType(to: BaseError.self)
                    .merge(with: remotePublisher)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
