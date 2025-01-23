//
//  MoviesListRepositoryTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/23/25.
//

import Combine
import XCTest
@testable import banquemisr_challenge05

final class MoviesListRepositoryTests: XCTestCase {
    private var localService: MockMoviesListLocalService!
    private var remoteService: MockMoviesListRemoteService!
    private var sut: MoviesListRepository!
    
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
    
    func testSUT_whenFetchMoviesSucceeds_locallyAndRemotelyReturnsMovies() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMoviesSucceeds_locallyAndRemotelyReturnsMovies")
        
        // When
        let cancellable = sut
            .getMovies(by: .playing)
            .sink(receiveCompletion: { completion in
                if case .finished = completion {
                    expectation.fulfill()
                }
            }, receiveValue: { movies in
                XCTAssertEqual(movies.count, 1)
            })
        
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }
    
    func testSUT_whenFetchMoviesSucceeds_moviesAreSavedLocally() {
        // Given
        let expectation = expectation(description: "testSUT_whenFetchMoviesSucceeds_moviesAreSavedLocally")
        
        // When
        let cancellable = sut
            .getMovies(by: .playing)
            .sink(receiveCompletion: { completion in
                if case .finished = completion {
                    expectation.fulfill()
                }
            }, receiveValue: { movies in
                XCTAssertNotNil(movies)
            })
        
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertTrue(localService.isSaved)
    }
    
    func testSUT_whenLocalFails_remoteSucceeds_moviesAreFetchedFromRemote() {
        // Given
        localService = .init(isSuccess: false)
        sut = .init(local: localService, remote: remoteService)
        
        let expectation = expectation(description: "testSUT_whenLocalFails_remoteSucceeds_moviesAreFetchedFromRemote")
        expectation.expectedFulfillmentCount = 2
        
        var fetchedMovies: [MovieResponse]?
        
        // When
        let cancellable = sut
            .getMovies(by: .playing)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTAssert(false)
                }
            }, receiveValue: { movies in
                fetchedMovies = movies
                expectation.fulfill()
            })

        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertEqual(fetchedMovies?.count, 1)
    }
    
    func testSUT_whenLocalAndRemoteFails_moviesAreEmpty() {
        // Given
        localService = .init(isSuccess: false)
        remoteService = .init(isSuccess: false)
        sut = .init(local: localService, remote: remoteService)
        
        let expectation = expectation(description: "testSUT_whenLocalAndRemoteFails_moviesAreEmpty")
        expectation.expectedFulfillmentCount = 2
        var fetchedError: BaseError?
        
        // When
        let cancellable = sut
            .getMovies(by: .playing)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    fetchedError = error
                    expectation.fulfill()
                }
            }, receiveValue: { movies in
                expectation.fulfill()
            })

        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
        
        XCTAssertEqual(fetchedError?.type, .unexpected)
    }
}
