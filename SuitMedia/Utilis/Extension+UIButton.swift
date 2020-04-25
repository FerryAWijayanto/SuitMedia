//
//  Extension+UIButton.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit.UIButton

extension UIButton {
    
    convenience init(title: String) {
        self.init()
        let attributeTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.6159868648, blue: 0.4593245133, alpha: 1)
        isEnabled = false
        layer.cornerRadius = 20
        setAttributedTitle(attributeTitle, for: .normal)
    }
}
