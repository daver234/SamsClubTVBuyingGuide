//
//  NetworkManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

/// A singleton to handle getting the data, parsing the JSON and converting to local a local data structure
class NetworkManager {
    
    // Mark: - Variables
    /// This is a singleton object
    static let instance = NetworkManager()
    fileprivate(set) var allProducts = [ProductPage]()
    fileprivate(set) var numberOfPagesRetrieved = 0
    fileprivate(set) var totalProductsCountFromServer = 0
    fileprivate(set) var totalPagesToGet = 0
    fileprivate(set) var isFirstLaunch = true
    fileprivate(set) var isEndOfData = false
    fileprivate(set) var totalProductsRetrieved = 0
    
    /// Prevent new instances from being created on the outside
    private init() {
    }
}


extension NetworkManager {
    /**
     Calls the external API to get products to fill the page
     - Parameters:
         - pageNumber:  An Int for the next page to retrieve
         - pageSize: An Int for the number of items per page
         - completion: bool for success or failure of call to API
    */
    func getProductsForPage(pageNumber: Int, pageSize: Int, completion: @escaping CompletionHandler) {
        ///Check to see if we have already retrieved all the data.  If so, return and don't call the API again.
        guard !isEndOfData else {
            print("GOT TO END DATA")
            completion(false)
            return
        }
        print("*** in NetworkManager: next pageNumber to get is:", pageNumber)
        
        guard API_KEY != "" else {
            showAlert(title: "Missing API Key", message: "Please add your own API KEY in Constants.swift at API_KEY.")
            return
        }
        guard let url = URL.init(string: "\(BASE_URL)/\(API_KEY)/\(pageNumber)/\(pageSize)") else {
            print("Error: in guard for URL so something didn't work")
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint("Received an error trying to get the data:", error!)
                completion(false)
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
                
                self.allProducts.append(result)
                print("*** number in allProducts; numberOfPagesRetrieved; 1st 1 greater than 2nd", self.allProducts.count, self.numberOfPagesRetrieved)
                
                /// Since a page was retrieved, increment the counter
                self.numberOfPagesRetrieved += 1
                
                /// Check to see if we have retrieved all the pages.  If so, change isEndOfData to true.
                if self.totalPagesToGet == self.numberOfPagesRetrieved {
                    self.isEndOfData = true
                }
                
                guard let newProductsRetrieved = result.products?.count else { return }
                self.totalProductsRetrieved += newProductsRetrieved
                print("**** here is count of totalProductsRetrieved", self.totalProductsRetrieved)
                print("**** how many pages retrieved as per allProduct structure?", self.allProducts.count)
               
                /// Check to see if this is the first call to the API.  It happens on first launch.
                /// If so, then we need to know the total products on the server and then calculate
                /// how many pages we might need to retrieve.
                if self.isFirstLaunch {
                    if let setTotalProducts = self.allProducts[0].totalProducts {
                        self.totalProductsCountFromServer = setTotalProducts
                        
                        /// Calculate total number of pages that might need to be retrieved. Round up
                        self.totalPagesToGet = Int(ceil(Double(self.totalProductsCountFromServer) / Double(PAGE_SIZE)))
                        
                        /// Don't come throught this again so set isFirstLaunch to false
                        self.isFirstLaunch = false
                    }
                }
                
                completion(true)
                
            }  catch DecodingError.valueNotFound(let value, let context) {
                print("Value not found: \(value)")
                print("Debug description: \(context.debugDescription)")
                completion(false)
            }  catch DecodingError.typeMismatch(let type, let context) {
                print("Type mismatch: \(type)")
                print("Debug description: \(context.debugDescription)")
                completion(false)
            }  catch DecodingError.keyNotFound(let key, let context) {
                print("Missing key: \(key)")
                print("Debug description: \(context.debugDescription)")
                completion(false)
            } catch let jsonError {
                print("Error serializing JSON", jsonError)
                completion(false)
            }
            }.resume()
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
