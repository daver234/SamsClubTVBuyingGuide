//
//  MockDataManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

class MockDataManager {
    
    // MARK: - Variables
    var allMockData = [ProductPage]()
    static let instance = MockDataManager()
    
    func getMockDataForTopRated() {
        //guard let data = topRatedJson else { return }
        
        do {
            let result = try JSONDecoder().decode(ProductPage.self, from: topRatedJson)
            self.allMockData.append(result)
        } catch let jsonError {
            print("Error serializing JSON", jsonError)
            
        }
    }
}
