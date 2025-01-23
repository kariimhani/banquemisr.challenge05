//
//  UITableViewCellHelpersTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class UITableViewCellHelpersTests: XCTestCase {
    private var sut: UITableViewCell.Type!
    
    override func setUp() {
        super.setUp()
        sut = MovieTableViewCell.self
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenReuseIdentifierCalled_returnClassName() {
        // Given
        let expected = "MovieTableViewCell"
        
        // When
        let result = sut.reuseIdentifier
        
        // Then
        XCTAssertEqual(result, expected)
    }
}
