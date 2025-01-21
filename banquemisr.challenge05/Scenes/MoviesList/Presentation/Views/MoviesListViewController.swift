//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import UIKit
import Combine

class MoviesListViewController: UITableViewController {
    private let viewModel: any MoviesListViewModelContract
    private var subscriptions: Set<AnyCancellable> = .init()
    private var movies: [MovieUIModel]
        
    init(viewModel: any MoviesListViewModelContract) {
        self.viewModel = viewModel
        self.movies = []
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        applyStyling()
        registerCells()
        subscribeToMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadMovies()
    }
}

private extension MoviesListViewController {
    func setupNavigationTitle() {
        title = viewModel.title
    }
    
    func applyStyling() {
        view.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func registerCells() {
        tableView.register(
            MovieTableViewCell.nib,
            forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier
        )
    }
    
    func subscribeToMovies() {
        viewModel
            .movies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movies in
                self?.movies = movies
                self?.tableView.reloadData()
            }
            .store(in: &subscriptions)
    }
}

extension MoviesListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath)
        
        if let movieCell = cell as? MovieTableViewCell {
            let index = indexPath.row
            movieCell.configure(
                movies[index],
                isFirstItem: index == .zero,
                isLastItem: index == movies.count - 1
            )
        }
        
        return cell
    }
}
