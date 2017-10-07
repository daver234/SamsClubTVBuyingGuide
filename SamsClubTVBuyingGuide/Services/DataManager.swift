//
//  DataManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/6/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// Singleton class to manage the app data
class DataManager {
    
    static let instance = DataManager()
    
    fileprivate(set) var allProducts = [ProductPage]()
    fileprivate(set) var numberOfPagesRetrieved = 0
    fileprivate(set) var totalProductsCountFromServer = 0
    fileprivate(set) var totalPagesToGet = 0
    fileprivate(set) var isFirstLaunch = true
    fileprivate(set) var isEndOfData = false
    fileprivate(set) var totalProductsRetrieved = 0
    
    private init() {
        
    }
    
    func decodeData(data: Data, completion: @escaping CompletionHandler) {
        do {
            let result = try JSONDecoder().decode(ProductPage.self, from: data)
            self.allProducts.append(result)
            print("*** number in allProducts; numberOfPagesRetrieved: 1st 1 greater than 2nd", self.allProducts.count, self.numberOfPagesRetrieved)
            
            /// Update all variables
            self.numberOfPagesRetrieved += 1
            let _ = self.checkForEndOfDataIsTrue()
            self.updateNewProductsRetrieved(result: result)
            self.checkForFirstLaunch()
            completion(true)
        } catch let jsonError {
            print("Error serializing JSON", jsonError)
            completion(false)
        }
    }
    
    func checkForEndOfDataIsTrue() -> Bool {
        /// Check to see if we have retrieved all the pages.  If so, change isEndOfData to true.
        guard numberOfPagesRetrieved != 0 else {
            print("Just got page 0")
            return false
        }
        print("totalPaggesToGet, numberOfPagesRetrieved: ", self.totalPagesToGet, self.numberOfPagesRetrieved)
        guard !isEndOfData else {
            print("Got to end of data")
            return true
        }
        guard self.totalPagesToGet != self.numberOfPagesRetrieved || numberOfPagesRetrieved < totalPagesToGet else {
            self.isEndOfData = true
            return true
        }
        return false
    }
    
    func updateNewProductsRetrieved(result: ProductPage) {
        guard let newProductsRetrieved = result.products?.count else { return }
        self.totalProductsRetrieved += newProductsRetrieved
        print("**** here is count of totalProductsRetrieved", self.totalProductsRetrieved)
        print("**** how many pages retrieved as per allProduct structure?", self.allProducts.count)
    }
    
    func checkForFirstLaunch() {
        /// Check to see if this is the first call to the API.  It happens on first launch.
        /// If so, then we need to know the total products on the server and then calculate
        /// how many pages we might need to retrieve.
        /// This logic was done when I had the assumption that totalProducts was total products
        /// available from the server (e.g. TVs).  Turns out that totalProducts is really total pages, of which
        /// each page has products on it.  Kept this logic after discussions.  Could remove to get all 224 pages.
        guard isFirstLaunch else { return }
        guard let setTotalProducts = self.allProducts[0].totalProducts else { return }
        self.totalProductsCountFromServer = setTotalProducts
        
        /// Calculate total number of pages that might need to be retrieved. Round up
        self.totalPagesToGet = Int(ceil(Double(self.totalProductsCountFromServer) / Double(PAGE_SIZE)))
        print("totalPagesToGet", self.totalPagesToGet)
        
        /// Don't come throught this again so set isFirstLaunch to false
        self.isFirstLaunch = false

    }
}
