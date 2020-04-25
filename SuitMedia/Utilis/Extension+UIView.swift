//
//  Extension+UIView.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit.UIView

extension UIView {
    
    convenience init(color: UIColor, cornerRadius: CGFloat) {
        self.init()
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.8
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, topPadding: CGFloat, rightPadding: CGFloat, bottomPadding: CGFloat, leftPadding: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints   = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -rightPadding).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leftPadding).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
