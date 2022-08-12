//
//  UIView+Extension.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import UIKit

extension UIView {
    func addSombra() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10
    }
}
