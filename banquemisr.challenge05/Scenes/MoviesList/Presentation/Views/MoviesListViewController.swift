//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import UIKit
import Combine

class MoviesListViewController: UITableViewController,
                                UIAlertControllerProtocol {
    private let viewModel: any MoviesListViewModelContract
    private var subscriptions: Set<AnyCancellable> = .init()
    private var movies: [MovieUIModel] {
        didSet {
            tableView.reloadData()
        }
    }
        
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
        subscribeToState()
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
    
    func subscribeToState() {
        viewModel
            .state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .failure(let message):
                    self?.alert(message)
                    
                case .success(let data):
                    if let moviesData = data as? [MovieUIModel] {
                        self?.movies = moviesData
                    }
                    
                default:
                    break
                }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        Router.openDetail(for: movie.id, on: self)
    }
}

