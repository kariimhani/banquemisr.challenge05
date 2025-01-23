//
//  BaseErrorTypeTests.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class BaseErrorTypeTests: XCTestCase {
    func testSUT_badRequestCodeIsValid() {
        // Given
        let code: Int = 400
        let sut: BaseErrorType = .badRequest
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_badRequestMessageIsValid() {
        // Given
        let message: String = "The request was invalid. Please check the syntax or parameters and try again."
        let sut: BaseErrorType = .badRequest
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_unauthorizedCodeIsValid() {
        // Given
        let code: Int = 401
        let sut: BaseErrorType = .unauthorized
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_unauthorizedMessageIsValid() {
        // Given
        let message: String = "Authentication is required to access this resource. Please log in and try again."
        let sut: BaseErrorType = .unauthorized
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_forbiddenCodeIsValid() {
        // Given
        let code: Int = 403
        let sut: BaseErrorType = .forbidden
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_forbiddenMessageIsValid() {
        // Given
        let message: String = "You do not have permission to access this resource. Please check your access rights."
        let sut: BaseErrorType = .forbidden
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_notFoundCodeIsValid() {
        // Given
        let code: Int = 404
        let sut: BaseErrorType = .notFound
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_notFoundMessageIsValid() {
        // Given
        let message: String = "The requested resource could not be found. Please check the URL or try again later."
        let sut: BaseErrorType = .notFound
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_serverErrorCodeIsValid() {
        // Given
        let code: Int = 500
        let sut: BaseErrorType = .serverError
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_serverErrorMessageIsValid() {
        // Given
        let message: String = "An internal server error occurred. Please try again later."
        let sut: BaseErrorType = .serverError
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_invalidResponseCodeIsValid() {
        // Given
        let code: Int = 2
        let sut: BaseErrorType = .invalidResponse
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_invalidResponseMessageIsValid() {
        // Given
        let message: String = "The response from the server is invalid or unexpected. Please try again later."
        let sut: BaseErrorType = .invalidResponse
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_noInternetConnectionCodeIsValid() {
        // Given
        let code: Int = 3
        let sut: BaseErrorType = .noInternetConnection
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_noInternetConnectionMessageIsValid() {
        // Given
        let message: String = "No internet connection is available. Please check your network settings and try again."
        let sut: BaseErrorType = .noInternetConnection
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_decodingCodeIsValid() {
        // Given
        let code: Int = 4
        let sut: BaseErrorType = .decoding
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_decodingMessageIsValid() {
        // Given
        let message: String = "There was an error decoding the response data. Please try again later."
        let sut: BaseErrorType = .decoding
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
    
    func testSUT_unexpectedCodeIsValid() {
        // Given
        let code: Int = 5
        let sut: BaseErrorType = .unexpected
        
        // Then
        XCTAssertEqual(sut.code, code)
    }
    
    func testSUT_unexpectedMessageIsValid() {
        // Given
        let message: String = "An unexpected error occurred. Please try again later or contact support if the issue persists."
        let sut: BaseErrorType = .unexpected
        
        // Then
        XCTAssertEqual(sut.message, message)
    }
}
