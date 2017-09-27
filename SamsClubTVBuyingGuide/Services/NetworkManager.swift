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
        guard let url = URL.init(string: "\(BASE_URL)/\(API_KEY)/\(pageNumber)/\(pageSize)") else {
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
                let products = try JSONDecoder().decode(ProductPage.self, from: data)
                
                print(products.totalProducts ?? 0)
                print(products.pageNumber ?? 0)
                print(products.pageSize ?? 0)
                
                guard let first = products.products else {
                    return
                }
                
                guard let name = first[0].productName else { return }
                print("here is name: ", name)
                
                DispatchQueue.main.async {
                    self.allProducts.append(products)
                }
                
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
