//
//  MoviesListRemoteServiceTests.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class MoviesListRemoteServiceTests: XCTestCase {
    private var response: MoviesResponse!
    private var service: APIServiceContract!
    private var sut: MoviesListRemoteService!
    
    override func setUp() {
        super.setUp()
        
        response = MockData.moviesResponse
        service = MockAPIService(isSuccess: true, object: response)
        sut = .init(service: service)
    }
    
    override func tearDown() {
        sut = nil
        service = nil
        response = nil
        
        super.tearDown()
    }
    
    func testSUT_whenFecthMovieCalled_returnSuccessfulResponse() {
        // Given
        let expectedResponse: MoviesResponse = MockData.moviesResponse
        let expectation = expectation(description: "testSUT_whenFecthMovieCalled_returnSuccessfulResponse")
        
        // When
        let cancellable = sut
            .fetchMovies(by: "type")
            .sink(
                receiveCompletion: { completion in
                    if case .finished = completion {
                        expectation.fulfill()
                    }
                },
                receiveValue: { response in
                    XCTAssertEqual(response.results.count, expectedResponse.results.count)
                    XCTAssertEqual(response.results.first?.id, expectedResponse.results.first?.id)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
    
    func testSUT_whenFecthMovieCalled_returnFailingResponse() {
        // Given
        let expectedError: BaseError = .init(type: .invalidResponse)
        let expectation = expectation(description: "testSUT_whenFecthMovieCalled_returnFailingResponse")
        
        // When
        sut = .init(service: MockAPIService(isSuccess: false, object: response))
        let cancellable = sut
            .fetchMovies(by: "type")
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        XCTAssertEqual(error, expectedError)
                        expectation.fulfill()
                    }
                },
                receiveValue: { response in
                    XCTAssertNil(response)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
}

