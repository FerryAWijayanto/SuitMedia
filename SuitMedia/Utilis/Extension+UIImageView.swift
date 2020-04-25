//
//  Extension+UIImageView.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit.UIImageView

extension UIImageView {
    
    convenience init(imageView: UIImage, cornerRadius: CGFloat, tint: UIColor?) {
        self.init()
        image = imageView
        
        tintColor = tint
        layer.cornerRadius = cornerRadius
    }
}
