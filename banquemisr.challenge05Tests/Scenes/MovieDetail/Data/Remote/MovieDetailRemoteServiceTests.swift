//
//  MovieDetailRemoteService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class MovieDetailRemoteServiceTests: XCTestCase {
    private var response: MovieDetailResponse!
    private var service: APIServiceContract!
    private var sut: MovieDetailRemoteService!
    
    override func setUp() {
        super.setUp()
        
        response = MockData.movieDetailResponse
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
        let expectation = expectation(description: "testSUT_whenFecthMovieCalled_returnSuccessfulResponse")
        
        // When
        let cancellable = sut
            .fetchMovie(by: 1)
            .sink(
                receiveCompletion: { completion in
                    if case .finished = completion {
                        expectation.fulfill()
                    }
                },
                receiveValue: { response in
                    XCTAssertNotNil(response)
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
            .fetchMovie(by: 1)
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

