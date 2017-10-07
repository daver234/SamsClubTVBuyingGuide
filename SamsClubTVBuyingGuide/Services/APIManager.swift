//
//  APIManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/6/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

class APIManager {
    let request = Request()
    
    func getProductsForPage(pageNumber: Int, pageSize: Int, completion: @escaping CompletionHandler) {
        print("*** in APIManager: next pageNumber to get is:", pageNumber)
        let urlString = "\(BASE_URL)/\(API_KEY)/\(pageNumber)/\(pageSize)"
        guard let url = URL(string: urlString) else { return }
        getProductsForPageWithURL(url: url, pageNumber: pageNumber, pageSize: pageSize, completion: completion)
    }
    
    /// This function signature can be used for testing since a URL can be passed in. Could pass in local JSON for XCTest
    func getProductsForPageWithURL(url: URL, pageNumber: Int, pageSize: Int, completion: @escaping CompletionHandler) {
        /// Check to see if we have already retrieved all the data.  If so, return and don't call the API again.
        guard !DataManager.instance.checkForEndOfDataIsTrue() else {
            print("GOT TO END DATA")
            completion(false)
            return
        }
        request.url = url
        request.callAPI(completion: completion)
    }
}
