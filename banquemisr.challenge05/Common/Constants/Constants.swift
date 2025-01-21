//
//  Constants.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

enum Constants {
    enum TabBar {
        enum NowPlaying {
            static let title: String = "Now Playing"
            static let unselectedImage: String = "play.circle"
            static let selectedImage: String = "play.circle.fill"
        }
        
        enum Popular {
            static let title: String = "Popular"
            static let unselectedImage: String = "flame"
            static let selectedImage: String = "flame.fill"
        }
        
        enum Upcoming {
            static let title: String = "Coming Soon..."
            static let unselectedImage: String = "clock"
            static let selectedImage: String = "clock.fill"
        }
    }
    
    enum APIPath {
        static let movie: String = "movie"
    }
    
    enum DateFormat {
        static let responseFormat: String = "yyyy-MM-dd"
        static let productionYearFormat: String = "(yyyy)"
    }
    
    enum Image {
        static let host: String = ConfigurationManager.shared.string(key: .imageHost)
        
        enum Size {
            static let small: String = "w500"
            static let original: String = "Original"
        }
    }
}
