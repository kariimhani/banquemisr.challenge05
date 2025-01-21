//
//  MoviesListLocalServiceContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/21/25.
//

import Combine

protocol MoviesListLocalServiceContract {
    func fetchMovies(by category: String) -> AnyPublisher<MoviesResponse, BaseError>
    func save(movies: [MovieResponse], for category: String)
}
