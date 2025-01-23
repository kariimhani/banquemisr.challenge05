//
//  MovieDetailViewModelTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class MovieDetailViewModelTests: XCTestCase {
    private var id: Int!
    private var useCase: MockGetMovieDetailUseCase!
    private var sut: MovieDetailViewModel!
    
    override func setUp() {
        super.setUp()
        
        id = MockData.movieDetailResponse.id
        useCase = .init(isSuccess: true)
        sut = .init(id: id, useCase: useCase)
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        id = nil
        
        super.tearDown()
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
        let movie: MovieDetailUIModel = MockData.movieDetailUI
        let expectedState: ViewModelState = .success(movie)
        let expectation = expectation(description: "testSUT_whenLoadMovieCalled_returnSuccessfulState")
        expectation.expectedFulfillmentCount = 2
        
        var receivedState: ViewModelState?
        
        // When
        let cancellable = sut
            .state
            .sink(receiveValue: { state in
                receivedState = state
                expectation.fulfill()
            })
        
        sut.loadMovie()
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedState, expectedState)
    }
    
    func testSUT_whenLoadMovieCalled_returnFailingState() {
        useCase = .init(isSuccess: false)
        sut = .init(id: id, useCase: useCase)
        
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
        
        sut.loadMovie()
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedState, expectedState)
    }
}
