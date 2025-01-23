//
//  MockMoviesListData.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import Combine
@testable import banquemisr_challenge05

class MockMoviesListLocalService: MoviesListLocalServiceContract {
    private let isSuccess: Bool
    var isSaved: Bool = false
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func fetchMovies(by category: String) -> AnyPublisher<banquemisr_challenge05.MoviesResponse, banquemisr_challenge05.BaseError> {
        if isSuccess {
            return Just(MockData.moviesResponse)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
    
    func save(movies: [banquemisr_challenge05.MovieResponse], for category: String) {
        isSaved = isSuccess
    }
}

class MockMoviesListRemoteService: MoviesListRemoteServiceContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func fetchMovies(by category: String) -> AnyPublisher<MoviesResponse, BaseError> {
        if isSuccess {
            return Just(MockData.moviesResponse)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}

class MockMoviesListRepository: MoviesListRepositoryContract {
    private let isSuccess: Bool
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    
    func getMovies(by category: MovieCategory) -> AnyPublisher<[MovieResponse], BaseError> {
        if isSuccess {
            return Just(MockData.moviesResponse.results)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: .unexpected)
            .eraseToAnyPublisher()
    }
}
