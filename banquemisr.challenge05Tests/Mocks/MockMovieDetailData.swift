//
//  MockMovieDetailData.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import Combine
@testable import banquemisr_challenge05

class MockMovieDetailLocalService: MovieDetailLocalServiceContract {
    private let isSuccess: Bool
    var isSaved: Bool = false
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse?, BaseError> {
        if isSuccess {
            return Just(MockData.movieDetailResponse)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
    
    func save(movie: MovieDetailResponse) {
        isSaved = isSuccess
    }
}

class MockMovieDetailRemoteService: MovieDetailRemoteServiceContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func fetchMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError> {
        if isSuccess {
            return Just(MockData.movieDetailResponse)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}

class MockMovieDetailsRepository: MovieDetailRepositoryContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func getMovie(by id: Int) -> AnyPublisher<MovieDetailResponse, BaseError> {
        if isSuccess {
            return Just(MockData.movieDetailResponse)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}
