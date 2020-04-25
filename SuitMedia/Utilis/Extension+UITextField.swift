//
//  Extension+UITextField.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    
    convenience init(inputText: String, cornerRadius: CGFloat) {
        self.init()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholders = NSAttributedString(string: inputText, attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        attributedPlaceholder = attributedPlaceholders
        layer.cornerRadius = cornerRadius
        textAlignment = .center
        textColor = UIColor.darkGray
        font = UIFont.systemFont(ofSize: 14)
        backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
    }
    
}
