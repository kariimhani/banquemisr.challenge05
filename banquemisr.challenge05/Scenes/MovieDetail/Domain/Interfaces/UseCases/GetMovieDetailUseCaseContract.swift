//
//  GetMovieDetailUseCaseContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

protocol GetMovieDetailUseCaseContract {
    func execute(using id: Int) -> AnyPublisher<MovieDetailUIModel, BaseError>
}
