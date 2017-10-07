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
    
    func testSamsClubAPICall() {
        let expectationResult = expectation(description: "Call the Sams Club API and get back 1 page with 30 products")
        APIManager().getProductsForPage(pageNumber: STARTING_PAGE_NUMBER, pageSize: PAGE_SIZE) { (response) in
            XCTAssertTrue(response)
            expectationResult.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testCheckMockJsonData() {
        let expectationResult = expectation(description: "Call the Sams Club API and get back 1 page with 30 products")
        do {
            guard let file = Bundle.main.url(forResource: "firstPage", withExtension: "json") else { return }
            let data = try Data(contentsOf: file)
            DataManager.instance.decodeData(data: data) { (response) in
                guard response else {
                    print("Error in APIManager response in checkMockJsonDataTest")
                    return
                }
                XCTAssertTrue(response)
                expectationResult.fulfill()
            }
        } catch let jsonError {
            print("error in test case parsing mock json \(jsonError.localizedDescription)")
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
