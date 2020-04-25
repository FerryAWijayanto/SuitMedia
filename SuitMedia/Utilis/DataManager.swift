//
//  DataManager.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

protocol DataManager {
    func load(file name: String) -> [[String: AnyObject]]
}

extension DataManager {
    func load(file name: String) -> [[String: AnyObject]] {
        guard
            let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else {
                return [[:]]
        }
        return items as! [[String: AnyObject]]
    }
}
