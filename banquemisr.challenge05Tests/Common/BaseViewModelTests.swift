//
//  BaseViewModelTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim  on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class BaseViewModelTests: XCTestCase {
    var sut: BaseViewModel!
    
    override func setUp() {
        super.setUp()
        sut = BaseViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_stateIsLoading() {
        // Then
        XCTAssertEqual(sut.state.value, .loading)
    }
    
    func testSUT_whenInitCalled_subscriptionsIsEmpty() {
        // Then
        XCTAssertTrue(sut.subscriptions.isEmpty)
    }
    
    func testSUT_whenDeinitCalled_subscriptionsAreCleared() {
        // Given
        weak var viewModel = sut
        // When
        sut = nil
        
        // Then
        XCTAssertNil(viewModel)
    }
    
    func testSUT_whenStateIsUpdated_stateIsFailure() {
        // Given
        let expectedState: ViewModelState = .failure("Failure")
        let expectation = self.expectation(description: "State is changed")
        
        let cancellable = sut.state
            .sink { newState in
                if newState == expectedState {
                    expectation.fulfill()
                }
            }
        
        // When
        sut.state.send(.failure("Failure"))
        
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }
}
