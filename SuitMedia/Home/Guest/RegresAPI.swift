//
//  RegresAPI.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

enum RegresError: String, Error {
    case invalidJSONData    = "Failed to parse JSON Data"
    case invalidData        = "Failed to fetch data network error"
    case invalidResponse    = "Network Error"
    case invalidGuest       = "Guest not found"
}

struct RegresAPI {
    
    private static let baseURL = "https://reqres.in/api/users"
    
    static func regresAPI(_ parameters: [String: String]?) -> URL {
        var components = URLComponents(string: baseURL)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "page": "1",
            "per_page": "10"
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
}
