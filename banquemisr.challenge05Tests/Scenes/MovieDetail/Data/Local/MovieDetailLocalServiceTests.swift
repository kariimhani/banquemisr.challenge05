//
//  MovieDetailLocalServiceTests.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import XCTest
import Combine
import CoreData
@testable import banquemisr_challenge05

final class MovieDetailLocalServiceTests: XCTestCase {
    private var sut: MovieDetailLocalService!
    
    override func setUp() {
        super.setUp()
        
        sut = .init(controller: MockDataController(isSuccess: true))
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testSUT_whenFetchMovieCalled_returnMovie() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMovieCalled_returnMovie")
        
        // When
        let cancellable = sut
            .fetchMovie(by: Int(MockData.movieDetail.id))
            .sink(
                receiveCompletion: { completion in
                    if case .finished = completion {
                        expectation.fulfill()
                    }
                },
                receiveValue: { _ in
                    XCTAssert(true)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
    
    func testSUT_whenFetchMovieCalled_returnException() {
        // Given
        sut = .init(controller: MockDataController(isSuccess: false))
        let expectation = expectation(description: "testSUT_whenFetchMovieCalled_returnException")
        
        // When
        let cancellable = sut
            .fetchMovie(by: Int(MockData.movieDetail.id))
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        expectation.fulfill()
                    }
                },
                receiveValue: { _ in }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
}
