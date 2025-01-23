//
//  NavigationController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

class NavigationControllerTests: XCTestCase {
    private var sut: NavigationController!
    private var navigationBar: UINavigationBar {
        sut.navigationBar
    }
    
    override func setUp() {
        super.setUp()
        sut = NavigationController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenViewDidLoad_prefersLargeTitlesIsSet() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertTrue(navigationBar.prefersLargeTitles)
    }
    
    func testSUT_whenViewDidLoad_blackBackgroundIsSet() {
        // When
        _ = sut.view
        
        // Then
        let appearance = navigationBar.standardAppearance
        XCTAssertEqual(appearance.backgroundColor, .black)
    }
    
    func testSUT_whenViewDidLoad_titleTextAttributesIsSet() {
        // When
        _ = sut.view
        
        // Then
        let appearance = navigationBar.standardAppearance
        XCTAssertEqual(appearance.titleTextAttributes[.foregroundColor] as? UIColor, UIColor.white)
    }
    
    func testSUT_whenViewDidLoad_largeTitleTextAttributesIsSet() {
        // When
        _ = sut.view
        
        // Then
        let appearance = navigationBar.standardAppearance
        XCTAssertEqual(appearance.largeTitleTextAttributes[.foregroundColor] as? UIColor, UIColor.white)
    }
    
    func testSUT_whenViewDidLoad_tintColorIsSet() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertEqual(sut.navigationBar.tintColor, UIColor.white)
    }
    
    func testSUT_whenEnableLargeTitleWithDefaultParameterCalled_prefersLargeTitlesIsSet() {
        // When
        sut.enableLargeTitle()
        
        // Then
        XCTAssertTrue(navigationBar.prefersLargeTitles)
    }
    
    func testSUT_whenEnableLargeTitleWithCustomParameterCalled_prefersLargeTitlesIsSet() {
        // Given
        let isEnabled = false
        
        // When
        sut.enableLargeTitle(isEnabled)
        
        // Then
        XCTAssertFalse(navigationBar.prefersLargeTitles)
    }
    
    func testSUT_whenBackgroundColorCalled_backgroundColorIsSet() {
        // Given
        let color: UIColor = .red
        
        // When
        sut.setupBackgroundColor(color)
        
        // Then
        let appearance = navigationBar.standardAppearance
        XCTAssertEqual(appearance.backgroundColor, color)
    }
}
