//
//  UIViewControllerHelpersTests.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class UIViewControllerHelpersTests: XCTestCase {
    private var sut: UIViewController.Type!
    
    override func setUp() {
        super.setUp()
        sut = MovieDetailViewController.self
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenReuseIdentifierCalled_returnClassName() {
        // Given
        let expected = "MovieDetailViewController"
        
        // When
        let result = sut.nibName
        
        // Then
        XCTAssertEqual(result, expected)
    }
}
