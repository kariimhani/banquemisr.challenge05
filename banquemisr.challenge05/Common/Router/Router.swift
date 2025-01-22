//
//  Router.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import UIKit

enum Router {
    static func openDetail(for movieId: Int, on source: UIViewController) {
        let viewModel: MovieDetailViewModelContract = MovieDetailViewModel(id: movieId)
        let viewController: MovieDetailViewController = .init(viewModel: viewModel)
        
        source.navigationController?.pushViewController(viewController, animated: true)
    }
}
