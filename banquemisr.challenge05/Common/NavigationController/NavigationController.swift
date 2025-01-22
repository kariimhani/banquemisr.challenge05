//
//  NavigationController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableLargeTitleIfNeeded()
        setupDefaultAppearance()
        setTintColor()
    }
    
    func enableLargeTitle(_ isEnabled: Bool = true) {
        navigationBar.prefersLargeTitles = isEnabled
    }
    
    func setupDefaultAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .black
        appearance.shadowColor = .clear
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        setAppearance(appearance)
    }
    
    func setupBackgroundColor(_ color: UIColor) {
        let appearance = navigationBar.standardAppearance
        appearance.backgroundColor = color
        
        setAppearance(appearance)
    }
}

private extension NavigationController {
    func enableLargeTitleIfNeeded() {
        navigationBar.prefersLargeTitles = true
    }
    
    func setTintColor() {
        navigationBar.tintColor = .white
    }
    
    func setAppearance(_ appearance: UINavigationBarAppearance) {
        navigationBar.standardAppearance = appearance
    }
}
