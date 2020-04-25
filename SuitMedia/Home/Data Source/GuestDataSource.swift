//
//  GuestDataSource.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class GuestDataSource: NSObject, UICollectionViewDataSource {
    var items = [Guest]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GuestsCell.cellID, for: indexPath) as! GuestsCell
        let guest = items[indexPath.row]
        
        cell.update(with: guest)
        return cell
    }
    
    
}
