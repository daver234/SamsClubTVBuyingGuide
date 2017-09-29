//
//  SamsClubTVBuyingGuideTests.swift
//  SamsClubTVBuyingGuideTests
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import XCTest
@testable import SamsClubTVBuyingGuide

class SamsClubTVBuyingGuideTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func samsClubAPICallTest() {
        let expectationResult = expectation(description: "Call the Sams Club test API and get back 1 page with 30 products")
        NetworkManager.instance.getProductsForPage(pageNumber: STARTING_PAGE_NUMBER, pageSize: PAGE_SIZE) { (response) in
            XCTAssertTrue(response)
            expectationResult.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
