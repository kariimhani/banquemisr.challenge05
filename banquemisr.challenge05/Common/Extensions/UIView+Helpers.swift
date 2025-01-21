//
//  UIView+Helpers.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import UIKit.UIView

extension UIView {
    func resetCornerRadius() {
        clipsToBounds = false
        layer.cornerRadius = .zero
    }
    
    func addCornerRadius(_ radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    func addCornerRadius(
        _ radius: CGFloat,
        corners: CACornerMask
    ) {
        addCornerRadius(radius)
        layer.maskedCorners = corners
    }
}
