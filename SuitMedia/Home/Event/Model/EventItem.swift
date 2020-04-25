//
//  EventItem.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

struct EventItem {
    
    let id: String?
    let name: String?
    let date: String?
    let imageName: String?
}

extension EventItem {
    init(dict: [String: AnyObject]) {
        self.id = dict["id"] as? String
        self.name = dict["name"] as? String
        self.date = dict["date"] as? String
        self.imageName = dict["imageName"] as? String
    }
}
