//
//  UIImageView+Helpers.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import UIKit.UIImageView

extension UIImageView {
    func download(
        host: String = Constants.Image.host,
        using path: String,
        and size: String = Constants.Image.Size.original,
        imageFetcher: ImageFetcherContract = ImageFetcher()
    ) {
        guard let url = URL(string: "\(host)/\(size)/\(path)") else { return }
        imageFetcher.downloadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

