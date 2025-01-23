//
//  BaseErrorTests.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class BaseErrorTests: XCTestCase {
    private var sut: BaseError!
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenInitCalled_codeIsSet() {
        // Given
        let type: BaseErrorType = .badRequest
        
        // When
        sut = .init(type: type)
        
        // Then
        XCTAssertEqual(sut.code, type.code)
    }
    
    func testSUT_whenInitCalled_messageIsSet() {
        // Given
        let type: BaseErrorType = .badRequest
        
        // When
        sut = .init(type: type)
        
        // Then
        XCTAssertEqual(sut.message, type.message)
    }
    
    func testSUT_whenInitCalled_typeIsSet() {
        // Given
        let type: BaseErrorType = .badRequest
        
        // When
        sut = .init(type: type)
        
        // Then
        XCTAssertEqual(sut.type, type)
    }
    
    func testSUT_whenUnexpectedCalled_codeIsSet() {
        // Given
        let type: BaseErrorType = .unexpected
        
        // When
        sut = .unexpected
        
        // Then
        XCTAssertEqual(sut.code, type.code)
    }
    
    func testSUT_whenUnexpectedCalled_messageIsSet() {
        // Given
        let type: BaseErrorType = .unexpected
        
        // When
        sut = .unexpected
        
        // Then
        XCTAssertEqual(sut.message, type.message)
    }
    
    func testSUT_whenUnexpectedCalled_typeIsSet() {
        // Given
        let type: BaseErrorType = .unexpected
        
        // When
        sut = .unexpected
        
        // Then
        XCTAssertEqual(sut.type, type)
    }
}
