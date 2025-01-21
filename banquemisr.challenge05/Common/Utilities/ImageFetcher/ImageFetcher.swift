//
//  ImageFetcher.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import UIKit

protocol ImageFetcherContract {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

class ImageFetcher: ImageFetcherContract {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if (error != nil) {
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }
        .resume()
    }
}
