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
    private var controller: MockDataController!
    private var sut: MovieDetailLocalService!
    
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
        controller = MockDataController(isSuccess: false)
        sut = .init(controller: controller)
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
    
    func testSUT_whenSaveIsCalled_shouldSaveData() {
        // Given
        let movie: MovieDetailResponse = .init(
            id: .zero,
            title: "",
            posterPath: "",
            backdropPath: "",
            runtime: .zero,
            releaseDate: "",
            originalLanguage: "",
            overview: ""
        )
        
        // When
        sut.save(movie: movie)
        
        // Then
        XCTAssertTrue(controller.isSaved)
    }
}
