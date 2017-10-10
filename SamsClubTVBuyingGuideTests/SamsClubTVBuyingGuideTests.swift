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
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testFirstPageHasProducts() {
        let expectationResult = expectation(description: "First page contains 30 products")
        APIManager().getProductsForPage(pageNumber: STARTING_PAGE_NUMBER, pageSize: PAGE_SIZE) { (response) in
            if DataManager.instance.allProducts.first?.products?.count == PAGE_SIZE {
                XCTAssertTrue(response)
                expectationResult.fulfill()
            } else {
                print("Error, first page does not have ")
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testContentFromFirstPage() {
        let expectationResult = expectation(description: "No fields in first product are blank")
        var testProduct = [ProductPage]()
        var resultCounter = 0
        
        testProduct = DataManager.instance.allProducts
        
        guard testProduct.first?.products?.first?.productId != "" else { return }
        resultCounter += 1
        
        guard testProduct.first?.products?.first?.productName != "" else { return }
        resultCounter += 1
        
        guard testProduct.first?.products?.first?.shortDescription?.html2String !=  "" else { return }
        resultCounter += 1
        
        guard testProduct.first?.products?.first?.longDescription?.html2String !=  "" else { return }
        resultCounter += 1
        
        guard let reviewRate = testProduct.first?.products?.first?.reviewRating, Int(reviewRate) >= 0 else { return }
        resultCounter += 1
        
        guard let revCount = testProduct.first?.products?.first?.reviewCount, Int(revCount) >= 0 else { return }
        resultCounter += 1
        
        XCTAssertTrue(resultCounter == 6)
        expectationResult.fulfill()
        
        waitForExpectations(timeout: 10) { error in
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
