//
//  Product.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// The data structures used to store the parased results from the server
struct ProductPage: Decodable {
    
    /// Some type of Id
    var id: String?
    
    /// Dictionary of products
    var products: [Product]?
    
    /// Total number of TVs in backend data store
    var totalProducts: Int?
    
    /// Current page number
    var pageNumber: Int?
    
    /// The page size
    var pageSize: Int?
    
    /// Response status code
    var status: Int?
    
    /// Kind of item
    var kind: String?
    
    /// Etag number
    var etag: String?
    
}

struct Product: Decodable {
    
    /// Unique product ID
    var productId: String?
    
    /// Product name
    var productName: String?
    
    /// Short product description
    var shortDescription: String?
    
    /// Long product description
    var longDescription: String?
    
    /// Product price
    var price: String?
    
    /// Image URL
    var productImage: URL?
    
    /// User review rating score
    var reviewRating: Double?
    
    /// Number of reviews available
    var reviewCount: Int?
    
    /// Is the product in stock
    var inStock: Bool?
}

