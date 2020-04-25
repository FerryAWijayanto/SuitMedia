//
//  HomeView.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

protocol HomeViewDelegate {
    func presentToEvent()
    func presentToGuest()
}

class HomeView: UIView {
    
    let headerImageView = UIImageView(imageView: #imageLiteral(resourceName: "bg_bright"), cornerRadius: 0, tint: nil)
    let halloLbl = UILabel(bodyText: "Hallo,", color: #colorLiteral(red: 0.4705882353, green: 0.4705882353, blue: 0.4705882353, alpha: 1), fontSize: 25)
    let nameLbl = UILabel(headerText: "User", color: #colorLiteral(red: 0.9058823529, green: 0.4705882353, blue: 0.1764705882, alpha: 1), fontSize: 25)
    let lineOneView = UIView(color: #colorLiteral(red: 0.8862745098, green: 0.6980392157, blue: 0.5647058824, alpha: 1), cornerRadius: 0)
    let lineTwoView = UIView(color: #colorLiteral(red: 0.8862745098, green: 0.6980392157, blue: 0.5647058824, alpha: 1), cornerRadius: 0)
    let lineThreeView = UIView(color: #colorLiteral(red: 0.8862745098, green: 0.6980392157, blue: 0.5647058824, alpha: 1), cornerRadius: 0)
    let eventBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attributeTitle = NSAttributedString(string: "Choose Event", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        btn.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.4705882353, blue: 0.1764705882, alpha: 1)
        btn.layer.cornerRadius = 25
        btn.setAttributedTitle(attributeTitle, for: .normal)
        return btn
    }()
    
    let guestBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attributeTitle = NSAttributedString(string: "Choose Guest", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        btn.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.4705882353, blue: 0.1764705882, alpha: 1)
        btn.layer.cornerRadius = 25
        btn.setAttributedTitle(attributeTitle, for: .normal)
        return btn
    }()
    
    let logoImageView = UIImageView(imageView: #imageLiteral(resourceName: "img_suitmedia"), cornerRadius: 0, tint: nil)
    let detailImageView = UIImageView(imageView: #imageLiteral(resourceName: "img_bg_bottom"), cornerRadius: 0, tint: nil)
    
    var delegate: HomeViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        eventBtn.addTarget(self, action: #selector(handleToEvent), for: .touchUpInside)
        guestBtn.addTarget(self, action: #selector(handleToGuest), for: .touchUpInside)
        
        configure()
    }
    
    @objc private func handleToEvent() {
        delegate?.presentToEvent()
    }
    
    @objc private func handleToGuest() {
        delegate?.presentToGuest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        backgroundColor = .white
        [headerImageView, halloLbl, nameLbl, lineOneView, lineTwoView, lineThreeView, eventBtn, guestBtn, logoImageView, detailImageView].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        })
        
        nameLbl.textAlignment = .left
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 195),
            
            halloLbl.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            halloLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            halloLbl.widthAnchor.constraint(equalToConstant: 70),
            halloLbl.heightAnchor.constraint(equalToConstant: 20),
            
            nameLbl.topAnchor.constraint(equalTo: halloLbl.bottomAnchor, constant: 6),
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLbl.widthAnchor.constraint(equalToConstant: 70),
            nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lineOneView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            lineOneView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineOneView.widthAnchor.constraint(equalToConstant: 225),
            lineOneView.heightAnchor.constraint(equalToConstant: 2),
            
            lineTwoView.topAnchor.constraint(equalTo: lineOneView.bottomAnchor, constant: 4),
            lineTwoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineTwoView.widthAnchor.constraint(equalToConstant: 250),
            lineTwoView.heightAnchor.constraint(equalToConstant: 2),
            
            lineThreeView.topAnchor.constraint(equalTo: lineTwoView.bottomAnchor, constant: 4),
            lineThreeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineThreeView.widthAnchor.constraint(equalToConstant: 225),
            lineThreeView.heightAnchor.constraint(equalToConstant: 2),
            
            eventBtn.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 75),
            eventBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            eventBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            eventBtn.heightAnchor.constraint(equalToConstant: 50),
            
            guestBtn.topAnchor.constraint(equalTo: eventBtn.bottomAnchor, constant: 12),
            guestBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            guestBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            guestBtn.heightAnchor.constraint(equalToConstant: 50),
            
            logoImageView.topAnchor.constraint(equalTo: guestBtn.bottomAnchor, constant: 75),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 230),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
