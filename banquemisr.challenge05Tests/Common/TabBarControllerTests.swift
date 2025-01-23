//
//  TabBarControllerTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Karim  on 1/23/25.
//

import XCTest
@testable import banquemisr_challenge05

final class TabBarControllerTests: XCTestCase {
    private var sut: TabBarController!
    private var tabBar: UITabBar {
        sut.tabBar
    }
    
    override func setUp() {
        super.setUp()
        sut = TabBarController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenViewDidLoad_barTintColorIsSet() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertEqual(tabBar.barTintColor, .black)
    }
    
    func testSUT_whenViewDidLoad_tintColorIsSet() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertEqual(tabBar.tintColor, .white)
    }
    
    func testSUT_whenViewDidLoad_viewControllersAreSet() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertEqual(sut.viewControllers?.count, 3)
    }
    
    func testSUT_whenShouldSelectTabIsCalled_animationsAreDisabled() {
        // When
        _ = sut.tabBarController(sut, shouldSelect: .init())
        
        // Then
        XCTAssertFalse(UIView.areAnimationsEnabled)
    }
    
    func testSUT_whenDidSelectTabIsCalled_animationsAreEnabled() {
        // When
        _ = sut.tabBarController(sut, didSelect: .init())
        
        // Then
        XCTAssertTrue(UIView.areAnimationsEnabled)
    }
}
