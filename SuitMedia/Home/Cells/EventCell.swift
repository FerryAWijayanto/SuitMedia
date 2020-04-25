//
//  EventCell.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    static let cellID = "EventCell"
    
    let containerView = UIView(color: .white, cornerRadius: 10)
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "bg_bright")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let eventNameLbl = UILabel(headerText: "Event name", color: .darkText, fontSize: 14)
    let descriptionLbl = UILabel(bodyText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.", color: .gray, fontSize: 12)
    let dateLbl = UILabel(bodyText: "Apr 25, 2020", color: .lightGray, fontSize: 10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateEvent(with event: EventItem?) {
        if let eventToDisplay = event {
            eventImageView.image = UIImage(named: eventToDisplay.imageName ?? "")
            eventNameLbl.text = eventToDisplay.name ?? ""
            dateLbl.text = eventToDisplay.date ?? ""
        }
        
    }
    
    private func configure() {
        addSubview(containerView)
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        eventNameLbl.textAlignment = .left
        descriptionLbl.textAlignment = .left
        dateLbl.textAlignment = .right
        descriptionLbl.numberOfLines = 0
        
        let eventStackView = UIStackView(arrangedSubviews: [eventNameLbl, descriptionLbl, dateLbl])
        eventStackView.axis = .vertical
        eventStackView.distribution = .fillEqually
        
        let imageStackView = UIStackView(arrangedSubviews: [eventImageView, eventStackView])
        imageStackView.distribution = .fillEqually
//        imageStackView.spacing = 2
        
        let stackView = UIStackView(arrangedSubviews: [imageStackView, eventStackView])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        [stackView].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(v)
        })
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            eventNameLbl.topAnchor.constraint(equalTo: eventStackView.topAnchor, constant: 4),
            eventNameLbl.leadingAnchor.constraint(equalTo: eventStackView.leadingAnchor, constant: 8),
            eventNameLbl.trailingAnchor.constraint(equalTo: eventStackView.trailingAnchor, constant: -8),
            eventNameLbl.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLbl.topAnchor.constraint(equalTo: eventNameLbl.bottomAnchor, constant: 4),
            descriptionLbl.leadingAnchor.constraint(equalTo: eventStackView.leadingAnchor, constant: 8),
            descriptionLbl.trailingAnchor.constraint(equalTo: eventStackView.trailingAnchor, constant: -8),
            descriptionLbl.heightAnchor.constraint(equalToConstant: 100),
            
            dateLbl.bottomAnchor.constraint(equalTo: eventStackView.bottomAnchor),
            dateLbl.trailingAnchor.constraint(equalTo: eventStackView.trailingAnchor),
            dateLbl.leadingAnchor.constraint(equalTo: eventStackView.leadingAnchor),
            dateLbl.heightAnchor.constraint(equalToConstant: 20),
            
//            eventImageView.widthAnchor.constraint(equalToConstant: containerView.frame.width / 2),
//            eventImageView.heightAnchor.constraint(equalToConstant: containerView.frame.height),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

}
