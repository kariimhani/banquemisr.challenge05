//
//  MoviesListRemoteService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

final class MoviesListRemoteService: MoviesListRemoteServiceContract {
    private let service: APIServiceContract
    
    init(service: APIServiceContract = APIService.shared) {
        self.service = service
    }
    
    func fetchMovies(by category: String) -> AnyPublisher<Movies, BaseError> {
        let request = APIBuilder()
            .setPath(using: "movie")
            .setPath(using: category)
            .build()
        
        return service.request(
            using: request,
            responseType: Movies.self
        )
    }
}
