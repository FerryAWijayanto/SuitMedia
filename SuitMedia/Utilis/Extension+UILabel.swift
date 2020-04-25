//
//  Extension+UILabel.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit.UILabel

extension UILabel {
    
    convenience init(headerText: String, color: UIColor, fontSize: CGFloat) {
        self.init()
        text = headerText
        font = UIFont.boldSystemFont(ofSize: fontSize)
        textColor = color
        textAlignment = .center
    }
    
    convenience init(bodyText: String, color: UIColor, fontSize: CGFloat) {
        self.init()
        text = bodyText
        font = UIFont.systemFont(ofSize: fontSize)
        textColor = color
        textAlignment = .center
    }
}
