//
//  MovieDetailRemoteService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import Combine

final class MovieDetailRemoteService: MovieDetailRemoteServiceContract {
    private let service: APIServiceContract
    
    init(service: APIServiceContract = APIService()) {
        self.service = service
    }
    
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError> {
        let request = APIBuilder()
            .setMethod(using: .get)
            .setPath(using: Constants.APIPath.movie)
            .setPath(using: String(id))
            .build()
        
        return service.request(
            using: request,
            responseType: MovieDetailResponse.self
        )
    }
}
