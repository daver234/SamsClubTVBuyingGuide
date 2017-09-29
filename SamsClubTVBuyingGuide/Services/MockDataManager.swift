//
//  MockDataManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// A singleton class to set up the MockData
/// Still a work in progress
class MockDataManager {
    
    // MARK: - Variables
    static let instance = MockDataManager()
    fileprivate(set) var allMockData = [ProductPage]()
    fileprivate(set) var allMockDataProductsCount = 0
    
    // MARK: - Functions
    func getMockDataForTopRated() {
        guard let url = URL.init(string: "\(BASE_URL)/\(API_KEY)/\(0)/\(PAGE_SIZE)") else {
            print("Error: in guard for URL so something didn't work")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint("Received an error trying to get the data:", error!)
                return
            }
            
            /// Handle HTTP response
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if (statusCode != 200) {
                    debugPrint ("HTTP status code: ", statusCode)
                    return
                }
            }
            
            guard let data = data else { return }
            /// Now that we have data, let's decode it into the model and it to the local data structure.
            /// And do the appropriate checks to see if we are done getting data from the server.
            do {
                let result = try JSONDecoder().decode(ProductPage.self, from: data)
                self.allMockData.append(result)
                
            }  catch DecodingError.valueNotFound(let value, let context) {
                print("Missing key: \(value)")
                print("Debug description: \(context.debugDescription)")
            }  catch DecodingError.typeMismatch(let type, let context) {
                print("Type mismatch: \(type)")
                print("Debug description: \(context.debugDescription)")
            }  catch DecodingError.keyNotFound(let key, let context) {
                print("Missing key: \(key)")
                print("Debug description: \(context.debugDescription)")
            } catch let jsonError {
                print("Error serializing JSON", jsonError)
            }
            }.resume()
    }
}
