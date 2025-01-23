//
//  GradientView.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import UIKit.UIView

class GradientView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let color: UIColor = backgroundColor ?? .clear
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.colors = [
            color.withAlphaComponent(0.0),
            color.withAlphaComponent(0.5),
            color.withAlphaComponent(1.0)
        ]
        .compactMap { $0.cgColor }
        
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        backgroundColor = .clear
    }
}
