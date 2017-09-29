//
//  SamsClubTVBuyingGuideUITests.swift
//  SamsClubTVBuyingGuideUITests
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import XCTest

class SamsClubTVBuyingGuideUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
      
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        // Send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }
    
    func testShowAllProducts() {
        XCUIApplication().launch()
        app.buttons["Show All TVs"].tap()
        XCTAssert(app.staticTexts["Free shipping"].exists)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
