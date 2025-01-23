//
//  GetMovieDetailUseCaseTests.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class GetMovieDetailUseCaseTests: XCTestCase {
    private var repo: MockMovieDetailsRepository!
    private var sut: GetMovieDetailUseCase!
    
    override func setUp() {
        super.setUp()
        
        repo = MockMovieDetailsRepository(isSuccess: true)
        sut = .init(repository: repo)
    }
    
    override func tearDown() {
        sut = nil
        repo = nil
        
        super.tearDown()
    }
    
    func testSUT_whenExecuteCalled_returnSuccessfulResponse() {
        let expectedResponse: MovieDetailUIModel = .init(MockData.movieDetailResponse)
        let expectation = expectation(description: "testSUT_whenExecuteCalled_returnSuccessfulResponse")
        
        // When
        let cancellable = sut
            .execute(using: 1)
            .sink(
                receiveCompletion: { completion in
                    if case .finished = completion {
                        expectation.fulfill()
                    }
                },
                receiveValue: { response in
                    XCTAssertEqual(response.title, expectedResponse.title)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
    
    func testSUT_whenExecuteCalled_returnFailingResponse() {
        // Given
        repo = .init(isSuccess: false)
        sut = .init(repository: repo)
        
        let expectedError: BaseError = .unexpected
        let expectation = expectation(description: "testSUT_whenExecuteCalled_returnFailingResponse")
        
        // When
        let cancellable = sut
            .execute(using: 1)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        XCTAssertEqual(error, expectedError)
                        expectation.fulfill()
                    }
                },
                receiveValue: { response in
                    XCTAssert(false)
                }
            )
        
        // Then
        waitForExpectations(timeout: 1)
        cancellable.cancel()
    }
}
