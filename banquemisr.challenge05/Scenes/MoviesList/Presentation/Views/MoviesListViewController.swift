//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import UIKit
import Combine

class MoviesListViewController: UIViewController {
    private let viewModel: any MoviesListViewModelContract
    private var subscriptions: Set<AnyCancellable> = .init()
        
    init(viewModel: any MoviesListViewModelContract) {
        self.viewModel = viewModel
        
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadMovies()
    }
}
