//
//  MoviesListRepositoryContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

protocol MoviesListRepositoryContract {
    func getMovies(by category: MovieCategory) -> AnyPublisher<[Movie], BaseError>
}
