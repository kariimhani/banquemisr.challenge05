//
//  MockUseCases.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/24/25.
//

import Combine
@testable import banquemisr_challenge05

class MockGetMovieDetailUseCase: GetMovieDetailUseCaseContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func execute(using id: Int) -> AnyPublisher<MovieDetailUIModel, BaseError> {
        if isSuccess {
            return Just(.init(MockData.movieDetailResponse))
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}

class MockGetMoviesByCategoryUseCase: GetMoviesByCategoryUseCaseContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func execute(using category: MovieCategory) -> AnyPublisher<[MovieUIModel], BaseError> {
        if isSuccess {
            return Just(MockData.moviesUI)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}
