//
//  Constants.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// A centeral repo of the constants used in this app
/// Make changes here rather than in classes
typealias CompletionHandler = (_ Success: Bool) -> ()

/// URL Constants
let TOMS_GUIDE = "https://www.tomsguide.com/us/tv-buying-guide,review-1943.html"
let BASE_URL = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/walmartproducts"
let API_KEY = "e62b524f-4a34-403b-a65c-50cfdd487f46" // get a API key and enter here.

/// Segues
let THINGS_TO_KNOW = "toThingsToKnowVC"
let ARKIT_ROOM = "toARkitRoomVC"
let SHOW_ALL_TVS = "toShowAllTvs"
let PRODUCT_DETAIL = "toProductDetail"
let TOP_RATED = "toTopRated"
let FILTER_POPOVER = "toFilterPopOver"

/// Cells
let PRODUCT_CELL = "ProductCell"
let TOP_RATED_CELL = "TopRatedCell"
let TYPE_OF_FILTER = "TypeOfFilterCell"

/// Other
let OUT_OF_STOCK = "Out of stock"
let IN_STOCK = "In stock"
let STOCK_NOT_AVAILABLE = "Item not available"
let LOADING_IMAGE = "loadingImage.png"
let PAGE_SIZE = 30
let STARTING_PAGE_NUMBER = 0
let MOCK_DATA_CELL_COUNT = 5
let APPLE_MERCHENT_ID = "merchant.com.dave.samsclub"  // create and enter your merchant ID.  Needed for Apple Pay.
let FREE_SHIPPING = "Free shipping"

/// Scene Constants for ARKit related work
let MAIN_SCENE = "art.scnassets/main.scn"
let TV_SCENE_SCN = "art.scnassets/tvsScene.scn"
let BLACK_TV_DAE = "art.scnassets/smallBlackTV2.dae"
let BLACK_MODEL_NAME = "newTelevision"
let RETRO_NAME = "retro"
let RETRO_TV_DAE = "art.scnassets/retroB4.dae"
let RETRO_ELEMENT = "nmodel"

/// Errors
let MISSING_JSON_VALUE = "Value not available"

/// ViewController Identifiers
let FILTER_VC = "FilterVC"

/// Data
let filterType = ["Price: High","Price: Low","Screen Size", "4k", "Top Rated","Brands","Top Sellers" ]

/// Storyboard IDs
let PAGE_CONTROLLER = "PageViewController"
let DETAIL_PAGEVC = "ManageDetailPageVC"
let DETAIL_PAGE_CONTENT = "DetailPageContentVC"
