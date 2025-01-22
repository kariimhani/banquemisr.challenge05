//
//  MovieDetailRemoteServiceContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

protocol MovieDetailRemoteServiceContract {
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError>
}
