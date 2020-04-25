//
//  GuestsCell.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class GuestsCell: UICollectionViewCell {
    
    static let cellID = "GuestsCell"
    
    private let profileImageView = UIImageView(imageView: #imageLiteral(resourceName: "img_avatar"), cornerRadius: 0, tint: nil)
    private let profileNameLbl = UILabel(bodyText: "name", color: .darkText, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileImageView.layer.cornerRadius = 45
        profileImageView.clipsToBounds = true
        configure()
    }
    
    func update(with guest: Guest?) {
        if let guestToDisplay = guest {
            profileNameLbl.text = guestToDisplay.firstName
        } else {
            profileNameLbl.text = nil
        }
    }
    
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            profileImageView.image = imageToDisplay
        } else {
            profileImageView.image = nil
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [profileImageView, profileNameLbl].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        })
        
        profileNameLbl.textAlignment = .center
        
        NSLayoutConstraint.activate([
            
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            
            profileNameLbl.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 15),
            profileNameLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileNameLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileNameLbl.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
