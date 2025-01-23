//
//  MovieDetailRepositoryTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim  on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class MovieDetailRepositoryTests: XCTestCase {
    private var localService: MockMovieDetailLocalService!
    private var remoteService: MockMovieDetailRemoteService!
    private var sut: MovieDetailRepository!
    
    override func setUp() {
        super.setUp()
        
        localService = .init(isSuccess: true)
        remoteService = .init(isSuccess: true)
        sut = .init(local: localService, remote: remoteService)
    }
    
    override func tearDown() {
        sut = nil
        remoteService = nil
        localService = nil
        
        super.tearDown()
    }
    
    func testSUT_whenFetchMovieDetailSucceeds_locallyAndRemotelyReturnsMovieDetail() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMovieDetailSucceeds_locallyAndRemotelyReturnsMovieDetail")
        expectation.expectedFulfillmentCount = 2
        
        var fetchedMovie: MovieDetailResponse?
        
        // When
        let cancellable = sut
            .getMovie(by: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTAssert(false)
                }
            }, receiveValue: { movie in
                fetchedMovie = movie
                expectation.fulfill()
            })
        
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertNotNil(fetchedMovie)
    }
    
    func testSUT_whenFetchMovieDetailSucceeds_movieDetailAreSavedLocally() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMovieDetailSucceeds_movieDetailAreSavedLocally")
        expectation.expectedFulfillmentCount = 2
        
        // When
        let cancellable = sut
            .getMovie(by: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTAssert(false)
                }
            }, receiveValue: { _ in
                expectation.fulfill()
            })
        
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertTrue(localService.isSaved)
    }
    
    func testSUT_whenLocalFails_remoteSucceeds_movieIsFetchedFromRemote() {
        // Given
        localService = .init(isSuccess: false)
        sut = .init(local: localService, remote: remoteService)
        
        let expectation = expectation(description: "testSUT_whenLocalFails_remoteSucceeds_movieIsFetchedFromRemote")
        
        var fetchedMovie: MovieDetailResponse?
        
        // When
        let cancellable = sut
            .getMovie(by: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTAssert(false)
                }
            }, receiveValue: { movie in
                fetchedMovie = movie
                expectation.fulfill()
            })

        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertNotNil(fetchedMovie)
    }
    
    func testSUT_whenLocalAndRemoteFails_movieIsNil() {
        // Given
        localService = .init(isSuccess: false)
        remoteService = .init(isSuccess: false)
        sut = .init(local: localService, remote: remoteService)
        
        let expectation = expectation(description: "testSUT_whenLocalAndRemoteFails_movieIsNil")
        var fetchedError: BaseError?
        
        // When
        let cancellable = sut
            .getMovie(by: 1)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    fetchedError = error
                    expectation.fulfill()
                }
            }, receiveValue: { movies in
                XCTAssert(false)
            })

        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertEqual(fetchedError?.type, .unexpected)
    }
}
