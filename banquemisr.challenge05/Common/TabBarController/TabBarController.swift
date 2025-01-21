//
//  TabBarController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyling()
        setupViewController()
    }
}

private extension TabBarController {
    func applyStyling() {
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
    
    func setupViewController() {
        viewControllers = [
            makeMovieListViewController(for: .playing),
            makeMovieListViewController(for: .popular),
            makeMovieListViewController(for: .upcoming)
        ]
    }
    
    func makeMovieListViewController(for category: MovieCategory) -> UIViewController {
        let tabBarItem: UITabBarItem = .init(
            title: category.title,
            image: .init(systemName: category.systemImage),
            selectedImage: .init(systemName: category.selectedSystemImage)
        )
        
        let viewModel: MoviesListViewModelContract = MoviesListViewModel(category: category)
        let viewController: UIViewController = MoviesListViewController(viewModel: viewModel)
        viewController.tabBarItem = tabBarItem
        
        return NavigationController(rootViewController: viewController)
    }
}

fileprivate extension MovieCategory {
    var systemImage: String {
        switch self {
        case .playing: return Constants.TabBar.NowPlaying.unselectedImage
        case .popular: return Constants.TabBar.Popular.unselectedImage
        case .upcoming: return Constants.TabBar.Upcoming.unselectedImage
        }
    }
    
    var selectedSystemImage: String {
        switch self {
        case .playing: return Constants.TabBar.NowPlaying.selectedImage
        case .popular: return Constants.TabBar.Popular.selectedImage
        case .upcoming: return Constants.TabBar.Upcoming.selectedImage
        }
    }
}
