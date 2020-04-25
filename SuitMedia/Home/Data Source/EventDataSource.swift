//
//  EventDataSource.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class EventDataSource: NSObject, UITableViewDataSource {
    var eventItems = [EventItem]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.cellID, for: indexPath) as! EventCell
        
        let event = eventItems[indexPath.row]
        
        cell.updateEvent(with: event)
        
        return cell
    }
}
