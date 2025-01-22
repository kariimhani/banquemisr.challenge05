//
//  MovieDetailRepositoryContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

protocol MovieDetailRepositoryContract {
    func getMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError>
}
