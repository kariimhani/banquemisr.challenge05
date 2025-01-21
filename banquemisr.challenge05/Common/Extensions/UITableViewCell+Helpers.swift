//
//  UITableViewCell+Helpers.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import UIKit.UITableViewCell

extension UITableViewCell {
    class var reuseIdentifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
