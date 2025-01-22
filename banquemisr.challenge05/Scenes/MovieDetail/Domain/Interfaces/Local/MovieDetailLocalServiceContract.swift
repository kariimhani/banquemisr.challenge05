//
//  MovieDetailLocalServiceContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

protocol MovieDetailLocalServiceContract {
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse?, BaseError>
    func save(movie: MovieDetailResponse)
}
