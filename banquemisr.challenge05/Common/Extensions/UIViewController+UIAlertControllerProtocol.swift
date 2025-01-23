//
//  UIViewController.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import UIKit

protocol UIAlertControllerProtocol {
    func alert(_ message: String)
}

extension UIAlertControllerProtocol where Self: UIViewController {
    func alert(_ message: String) {
        let alert: UIAlertController = .init(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        present(alert, animated: true)
    }
}
