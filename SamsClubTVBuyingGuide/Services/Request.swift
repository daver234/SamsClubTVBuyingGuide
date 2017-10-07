//
//  Request.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/6/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/// Used to make the URL session request
class Request {
    var url: URL?
    
    func callAPI(completion: @escaping CompletionHandler) {
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("URLSession error: \(String(describing: error?.localizedDescription))")
                completion(false)
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Data or Response error in URLSession of Request.callAPI")
                completion(false)
                return
            }
            DataManager.instance.decodeData(data: data, completion: completion)
        }
        task.resume()
    }
}
