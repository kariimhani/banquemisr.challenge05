//
//  GetMoviesByCategoryUseCaseContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

protocol GetMoviesByCategoryUseCaseContract {
    func execute(using category: MovieCategory) -> AnyPublisher<[MovieUIModel], BaseError>
}
