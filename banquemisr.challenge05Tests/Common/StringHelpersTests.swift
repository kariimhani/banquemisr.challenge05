//
//  StringHelpersTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class StringHelpersTests: XCTestCase {
    func testSUT_whenFormattedDateCalled_returnFormattedDate() {
        // Given
        let date = "2025-01-01"
        let expected = "(2025)"
        
        // When
        let result = date.formattedDate()
        
        // Then
        XCTAssertEqual(result, expected)
    }
}
