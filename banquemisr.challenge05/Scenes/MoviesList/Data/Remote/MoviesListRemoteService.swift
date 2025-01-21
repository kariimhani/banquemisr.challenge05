//
//  MoviesListRemoteService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

final class MoviesListRemoteService: MoviesListRemoteServiceContract {
    private let service: APIServiceContract
    
    init(service: APIServiceContract = APIService()) {
        self.service = service
    }
    
    func fetchMovies(by category: String) -> AnyPublisher<MoviesResponse, BaseError> {
        let request = APIBuilder()
            .setMethod(using: .get)
            .setPath(using: "movie")
            .setPath(using: category)
            .build()
        
        return service.request(
            using: request,
            responseType: MoviesResponse.self
        )
    }
}
