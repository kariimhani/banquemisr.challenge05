//
//  MoviesListViewModel.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Foundation
import Combine

class MoviesListViewModel: MoviesListViewModelContract {
    private let category: MovieCategory
    private let useCase: GetMoviesByCategoryUseCaseContract
    private var subscriptions: Set<AnyCancellable>
    
    var movies: CurrentValueSubject<[MovieUIModel], Never>
    
    init(
        category: MovieCategory,
        useCase: GetMoviesByCategoryUseCaseContract = GetMoviesByCategoryUseCase()
    ) {
        self.category = category
        self.useCase = useCase
        
        subscriptions = .init()
        movies = .init([])
    }
}

// MARK: - OUTPUTS

extension MoviesListViewModel {
    var title: String {
        category.title
    }
}

// MARK: - INPUTS

extension MoviesListViewModel {
    func loadMovies() {
        useCase
            .execute(using: category)
            .receive(on: DispatchQueue.main)
            .sink { complition in
                // TODO: - Handle Errors
            } receiveValue: { [weak self] movies in
                self?.movies.send(movies)
            }
            .store(in: &subscriptions)
    }
}
