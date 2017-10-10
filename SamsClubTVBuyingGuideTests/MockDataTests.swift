//
//  MockDataTests.swift
//  SamsClubTVBuyingGuideTests
//
//  Created by David Rothschild on 10/9/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import XCTest
@testable import SamsClubTVBuyingGuide

class MockDataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCheckMockJsonData() {
        let expectationResult = expectation(description: "Parse the test JSON Data to see if the first product has a 4.5 review rating.")
        do {
            guard let file = Bundle.main.url(forResource: "firstPage", withExtension: "json") else { return }
            let data = try Data(contentsOf: file)
            DataManager.instance.decodeTestingData(data: data) { (response) in
                guard response else {
                    print("Error in APIManager response in checkMockJsonDataTest")
                    return
                }
                print("data: ",  DataManager.instance.allTestProducts.first?.totalProducts ?? 0)
                guard let rating = DataManager.instance.allTestProducts.first?.products?[0].reviewRating else { return }
                print("Here is rating: ", rating)
                if rating == 4.5 {
                    XCTAssertTrue(response)
                    expectationResult.fulfill()
                } else {
                    print("Error parsing local JSON data for product rating")
                }
                
            }
        } catch let jsonError {
            print("error in test case parsing mock json \(jsonError.localizedDescription)")
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
