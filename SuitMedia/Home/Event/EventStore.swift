//
//  EventStore.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

class EventStore: DataManager {
    
    fileprivate var eventItems = [EventItem]()
    
    func fetch(completion: @escaping ([EventItem]) -> Void) {
        for data in load(file: "EventModel") {
            let event = EventItem(dict: data)
            eventItems.append(event)
            completion(eventItems)
        }
    }
    
    func numberOfItems() -> Int {
        return eventItems.count
    }
    
    func event(at index: Int) -> EventItem {
        return eventItems[index]
    }
}
