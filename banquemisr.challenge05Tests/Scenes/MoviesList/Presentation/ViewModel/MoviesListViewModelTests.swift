//
//  MoviesListViewModelTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class MoviesListViewModelTests: XCTestCase {
    private var useCase: MockGetMoviesByCategoryUseCase!
    private var sut: MoviesListViewModel!
    
    override func setUp() {
        super.setUp()
        
        useCase = .init(isSuccess: true)
        sut = .init(category: .playing, useCase: useCase)
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_returnCorrectTitle() {
        // Given
        let category: MovieCategory = .playing
        let expectedTitle: String = category.title
        
        // When
        sut = .init(category: category, useCase: useCase)
        
        // Then
        XCTAssertEqual(sut.title, expectedTitle)
    }
    
    func testSUT_whenInitCalled_returnLoadingState() {
        let expectedState: ViewModelState = .loading
        let expectation = expectation(description: "testSUT_whenInitCalled_returnLoadingState")
        expectation.expectedFulfillmentCount = 1
        
        var receivedState: ViewModelState?
        
        // When
        let cancellable = sut
            .state
            .sink(receiveValue: { state in
                receivedState = state
                expectation.fulfill()
            })
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedState, expectedState)
    }

    func testSUT_whenLoadMovieCalled_returnSuccessfulState() {
        let movies: [MovieUIModel] = MockData.moviesUI
        let expectation = expectation(description: "testSUT_whenLoadMovieCalled_returnSuccessfulState")
        var receivedObject: [MovieUIModel]?
        
        // When
        let cancellable = sut
            .state
            .sink(receiveValue: { state in
                if case .success(let data) = state {
                    receivedObject = data as? [MovieUIModel]
                    expectation.fulfill()
                }
            })
        
        sut.loadMovies()
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedObject?.first?.title, movies.first?.title)
    }
    
    func testSUT_whenLoadMovieCalled_returnFailingState() {
        useCase = .init(isSuccess: false)
        sut = .init(category: .playing, useCase: useCase)
        
        let expectedState: ViewModelState = .failure(BaseErrorType.unexpected.message)
        let expectation = expectation(description: "testSUT_whenLoadMovieCalled_returnFailingState")
        expectation.expectedFulfillmentCount = 2
        
        var receivedState: ViewModelState?
        
        // When
        let cancellable = sut
            .state
            .sink(receiveValue: { state in
                receivedState = state
                expectation.fulfill()
            })
        
        sut.loadMovies()
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedState, expectedState)
    }
}
