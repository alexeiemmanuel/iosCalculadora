//
//  UIButtonExtension.swift
//  calculadora
//
//  Created by Alexei Emmanuel Martínez Mendoza on 04/12/22.
//

import UIKit

extension UIButton {
    
    
    func allowTextToScale(minFontScale: CGFloat = 0.5, numberOfLines: Int = 1) {
        
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = minFontScale
        self.titleLabel?.lineBreakMode = .byTruncatingTail
        
        self.titleLabel?.numberOfLines = numberOfLines

    }
}
