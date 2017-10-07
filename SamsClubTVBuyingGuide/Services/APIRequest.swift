//
//  APIRequest.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/6/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

class URLRequest {
    var url: URL?
    var successHandler: ((_ data: ProductPage) -> ())?
    var failureHandler: ((_ result: Any?, _ error: Error?) -> ())?
    
    func callAPI() {
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
                self.failureHandler?(response, error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                self.DataManager().deco data)
            }
        }
        task.resume()
    }
}

