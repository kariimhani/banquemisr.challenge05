//
//  MoviesListRemoteServiceContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

protocol MoviesListRemoteServiceContract {
    func fetchMovies(by category: String) -> AnyPublisher<MoviesResponse, BaseError>
}
