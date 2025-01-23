//
//  UIViewHelpersTests.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/24/25.
//

import XCTest
@testable import banquemisr_challenge05

final class UIViewHelpersTests: XCTestCase {
    private var sut: UIView!
    
    override func setUp() {
        super.setUp()
        sut = .init()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenAddCornerRadiusCalled_withoutCorners() {
        // Given
        let expected = 20.0
        
        // When
        sut.addCornerRadius(20.0)
        
        // Then
        XCTAssertEqual(sut.layer.cornerRadius, expected)
    }
    
    func testSUT_whenAddCornerRadiusCalled_clipBounds() {
        // When
        sut.addCornerRadius(20.0)
        
        // Then
        XCTAssertTrue(sut.clipsToBounds)
    }
    
    func testSUT_whenAddCornerRadiusCalled_withCorners() {
        // Given
        let expected: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // When
        sut.addCornerRadius(20.0, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        // Then
        XCTAssertEqual(sut.layer.maskedCorners, expected)
    }
    
    func testSUT_whenResetCornerRadiusCalled_returnZeroCornerRadius() {
        // Given
        let expected = 0.0
        
        // When
        sut.resetCornerRadius()
        
        // Then
        XCTAssertEqual(sut.layer.cornerRadius, expected)
    }
    
    func testSUT_whenResetCornerRadiusCalled_returnFalseClipToBounds() {
        // When
        sut.resetCornerRadius()
        
        // Then
        XCTAssertFalse(sut.clipsToBounds)
    }
}
