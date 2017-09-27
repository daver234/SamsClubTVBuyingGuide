//
//  NetworkManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

class NetworkManager {
    
    /// This is a singleton object
    static let instance = NetworkManager()
    
    /// Create dictionary of products (i.e. TVs)
    var allProducts = [ProductPage]()
    
    var justTvs = [Product]()
    fileprivate(set) var pageNumberCounter = 0
    fileprivate(set) var totalProductsCountFromServer = 0
    fileprivate(set) var firstLaunch = true
    fileprivate var notEndOfData = true
    
    /// Prevent new instances from being created on the outside
    private init() {
    }
}

extension NetworkManager {
    
    /// Call the external API to get the number of products to fill the page
    ///
    /// - Paramaters: pageNumber
    /// ....finish this
    func getProductsForPage(pageNumber: Int, pageSize: Int, completion: @escaping CompletionHandler) {
        if firstLaunch {
            firstLaunch = false
        } else if let setTotalProducts = allProducts[0].totalProducts {
            if setTotalProducts > 0 {
                totalProductsCountFromServer = setTotalProducts
                print("ok in here now", setTotalProducts)
                if pageNumberCounter == totalProductsCountFromServer {
                    notEndOfData = false
                }
            }
        }
        
       
        
        /// If we have got all the data (loaded all the pages of product into justTvs) then don't call the api again
        /// That means notEndOfData is false....we ARE at the end of the data.
        guard notEndOfData else { return }
        
        pageNumberCounter += 1
        
        guard let url = URL.init(string: "\(BASE_URL)/\(API_KEY)/\(pageNumberCounter)/\(pageSize)") else {
            print("in guard")
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
            
            // Now that we have data, let's decode it into the model
            do {
                let result = try JSONDecoder().decode(ProductPage.self, from: data)
                
                print(result.totalProducts ?? 0)
                print("pageNumberToGet: ", pageNumberToGet)
                print("pageNumber from result", result.pageNumber ?? 0)
                print(result.pageSize ?? 0)
                
                guard let foundProducts = result.products else {
                    return
                }
                
                guard let name = foundProducts[0].productName else { return }
                print("here is name: ", name)
                
                DispatchQueue.main.async {
                    self.allProducts.append(result)
                }
                
                DispatchQueue.main.async {
                    self.justTvs.append(foundProducts[0])
                }
                completion(true)
                
            }  catch DecodingError.valueNotFound(let value, let context) {
                print("Missing key: \(value)")
                print("Debug description: \(context.debugDescription)")
                completion(true)
            }  catch DecodingError.typeMismatch(let type, let context) {
                print("Type mismatch: \(type)")
                print("Debug description: \(context.debugDescription)")
                completion(true)
            }  catch DecodingError.keyNotFound(let key, let context) {
                print("Missing key: \(key)")
                print("Debug description: \(context.debugDescription)")
                completion(true)
            } catch let jsonError {
                print("Error serializing JSON", jsonError)
                completion(true)
            }
            }.resume()
    }
}
