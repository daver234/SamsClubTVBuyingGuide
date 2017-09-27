//
//  Constants.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

/// URL Constants
let TOMS_GUIDE = "https://www.tomsguide.com/us/tv-buying-guide,review-1943.html"
let BASE_URL = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/walmartproducts"
let API_KEY = "e62b524f-4a34-403b-a65c-50cfdd487f46"
let FULL_API_CALL = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/walmartproducts/e62b524f-4a34-403b-a65c-50cfdd487f46/1/20"

/// Segues
let THINGS_TO_KNOW = "toThingsToKnowVC"
let ARKIT_ROOM = "toARkitRoomVC"
let SHOW_ALL_TVS = "toShowAllTvs"
let PRODUCT_DETAIL = "toProductDetail"

/// Cells
let PRODUCT_CELL = "ProductCell"

/// Other
let OUT_OF_STOCK = "Out of stock"
let IN_STOCK = "In stock"
let STOCK_NOT_AVAILABLE = "Item not available"
let LOADING_IMAGE = "loadingImage.png"
let PAGE_SIZE = 30

/// Errors
let MISSING_JSON_VALUE = "Value not available"
