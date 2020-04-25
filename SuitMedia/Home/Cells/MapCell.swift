//
//  MapCell.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class MapCell: UICollectionViewCell {
    
    static let cellID = "MapCell"
    
    let containerView = UIView(color: .white, cornerRadius: 10)
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "bg_bright")
        return iv
    }()
    
    let eventNameLbl = UILabel(headerText: "Event name", color: .darkText, fontSize: 14)
    let descriptionLbl = UILabel(bodyText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.", color: .gray, fontSize: 12)
    let dateLbl = UILabel(bodyText: "Apr 25, 2020", color: .lightGray, fontSize: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
