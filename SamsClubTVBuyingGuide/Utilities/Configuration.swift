//
//  Configuration.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/29/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// Handles configuration logic for the Apple Pay merchant identifier
public class Configuration {
    
    private struct MainBundle {
        static var prefix = Bundle.main.object(forInfoDictionaryKey: "com.dave.samsclub") as! String
    }
    
    struct Merchant {
        static let identifier = "merchant."
    }
}
