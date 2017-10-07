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
        let app = XCUIApplication()
        app.buttons["Show All TVs"].tap()
        XCTAssert(app.staticTexts["Free shipping"].exists)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Samsung 50\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA"]/*[[".cells.staticTexts[\"Samsung 50\\\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA\"]",".staticTexts[\"Samsung 50\\\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.otherElements.buttons["Add to Cart"].tap()
        app.navigationBars["SamsClubTVBuyingGuide.ProductDetailVC"].buttons["All TVs"].tap()
        
    }
    
    func testTomsGuide() {
        XCUIApplication().launch()
        let app = XCUIApplication()
        app.buttons["Tom's Guide: 11 Things to Know"].tap()
    }
    
    func testShowTopRated() {
        XCUIApplication().launch()
        let app = XCUIApplication()
        app.buttons["See Top Rated TVs"].tap()
        let tablesQuery = app.tables
        let samsung50Class4kUltraHdLedSmartTvUn50ju650dfxzaStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Samsung 50\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA"]/*[[".cells.staticTexts[\"Samsung 50\\\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA\"]",".staticTexts[\"Samsung 50\\\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        samsung50Class4kUltraHdLedSmartTvUn50ju650dfxzaStaticText.tap()
        samsung50Class4kUltraHdLedSmartTvUn50ju650dfxzaStaticText.tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
