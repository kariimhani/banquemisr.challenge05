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
    
    init(
        category: MovieCategory,
        useCase: GetMoviesByCategoryUseCaseContract = GetMoviesByCategoryUseCase()
    ) {
        self.category = category
        self.useCase = useCase
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
            .sink { [weak self] complition in
                if case .failure(let error) = complition {
                    self?.state.send(.failure(error.message))
                }
            } receiveValue: { [weak self] movies in
                self?.state.send(.success(movies))
            }
            .store(in: &subscriptions)
    }
}
