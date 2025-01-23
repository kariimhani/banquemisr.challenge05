//
//  APIBuilderTests.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

class APIBuilderTests: XCTestCase {
    private var urlString: String!
    private var url: URL!
    private var sut: APIBuilder!

    override func setUp() {
        super.setUp()

        urlString = NetworkConstants.baseUrl
        url = URL(string: urlString)
        sut = APIBuilder()
    }
    
    override func tearDown() {
        urlString = nil
        url = nil
        sut = nil
        
        super.tearDown()
    }

    func testSUT_whenInitCalled_validURL() {
        // Given
        let expectedUrl = urlString

        // Then
        XCTAssertEqual(sut.urlRequest.url?.absoluteString, expectedUrl)
    }
    
    func testSUT_whenSetMethod_methodIsGet() {
        // Given
        let expectedMethod = "GET"

        // When
        sut = sut.setMethod(using: .get)

        // Then
        XCTAssertEqual(sut.urlRequest.httpMethod, expectedMethod)
    }

    func testSUT_whenSetPathCalled_urlIsValid() {
        // Given
        let path = "path"
        let expectedUrl = "\(urlString!)\(path)"

        // When
        sut = sut.setPath(using: path)

        // Then
        XCTAssertEqual(sut.urlRequest.url?.absoluteString, expectedUrl)
        
    }
    
    func testSUT_whenBuildCalled_contentTypeIsSet() {
        // Given
        let expectedContentType = NetworkConstants.contentTypeValue

        // When
        let result = sut.build()

        // Then
        XCTAssertEqual(result.value(forHTTPHeaderField: NetworkConstants.contentTypeKey), expectedContentType)
    }
}
