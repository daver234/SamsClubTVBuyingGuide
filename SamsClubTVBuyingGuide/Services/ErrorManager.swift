//
//  ErrorManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/6/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// Handle JSONDecoder errors
/// Not in use right now
class ErrorManager {
    
    func printAPIRequestResultError(error: DecodingError) {
        switch error {
        case DecodingError.keyNotFound(let key, let context):
            print("Value not found: \(key), Debug descriptioin:\(context.debugDescription)")
            break
        case DecodingError.valueNotFound(let value, let context):
            print("Value not found: \(value), Debug descriptioin:\(context.debugDescription)")
            break
        case DecodingError.typeMismatch(let type, let context):
            print("Type mismatch: \(type), Debug descriptioin:\(context.debugDescription)")
            break
        case DecodingError.dataCorrupted(let context):
            print("Debug descriptioin:\(context.debugDescription)")
            break
        }
    }
}
