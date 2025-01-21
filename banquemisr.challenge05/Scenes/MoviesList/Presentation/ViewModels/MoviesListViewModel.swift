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
    
    init(
        category: MovieCategory,
        useCase: GetMoviesByCategoryUseCaseContract = GetMoviesByCategoryUseCase()
    ) {
        self.category = category
        self.useCase = useCase
        
        subscriptions = .init()
    }
}

extension MoviesListViewModel {
    func loadMovies() {
        useCase
            .execute(using: category)
            .receive(on: DispatchQueue.main)
            .sink { complition in
                // TODO: - Handle Errors
            } receiveValue: { movies in
                debugPrint(movies.count)
            }
            .store(in: &subscriptions)
    }
}
