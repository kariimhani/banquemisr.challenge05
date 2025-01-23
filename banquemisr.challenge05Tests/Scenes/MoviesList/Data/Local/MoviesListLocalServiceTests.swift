//
//  MoviesListLocalServiceTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/23/25.
//

import XCTest
import Combine
import CoreData
@testable import banquemisr_challenge05

final class MoviesListLocalServiceTests: XCTestCase {
    private var controller: MockDataController!
    private var sut: MoviesListLocalService!
    
    override func setUp() {
        super.setUp()
        
        controller = MockDataController(isSuccess: true)
        sut = .init(controller: controller)
    }
    
    override func tearDown() {
        sut = nil
        controller = nil
        
        super.tearDown()
    }
    
    func testSUT_whenFetchMoviesCalled_returnListOfMovies() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMoviesCalled_returnListOfMovies")
        
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
                    XCTAssertNotNil(response)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
    
    func testSUT_whenFetchMoviesCalled_returnException() {
        // Given
        sut = .init(controller: MockDataController(isSuccess: false))
        let expectation = expectation(description: "testSUT_whenFetchMoviesCalled_returnException")
        
        // When
        let cancellable = sut
            .fetchMovies(by: "type")
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
    
    func testSUT_whenSaveIsCalled_shouldSaveData() {
        // Given
        let movie: MovieResponse = .init(
            id: .zero,
            title: "",
            overview: "",
            voteCount: .zero,
            posterPath: "",
            releaseDate: "",
            voteAverage: .zero,
            backdropPath: ""
        )
        
        // When
        sut.save(movies: [movie], for: "category")
        
        // Then
        XCTAssertTrue(controller.isInserted)
        XCTAssertTrue(controller.isSaved)
    }
}
