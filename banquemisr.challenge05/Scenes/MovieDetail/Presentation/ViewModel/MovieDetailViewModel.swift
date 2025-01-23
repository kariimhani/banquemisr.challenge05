//
//  MovieDetailViewModel.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import Foundation
import Combine

class MovieDetailViewModel: MovieDetailViewModelContract {
    private let movieId: Int
    private let useCase: GetMovieDetailUseCaseContract
    
    init(
        id: Int,
        useCase: GetMovieDetailUseCaseContract = GetMovieDetailUseCase()
    ) {
        self.useCase = useCase
        
        movieId = id
    }
}
// MARK: - INPUTS

extension MovieDetailViewModel {
    func loadMovie() {
        useCase
            .execute(using: movieId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] complition in
                if case .failure(let error) = complition {
                    self?.state.send(.failure(error.message))
                }
            } receiveValue: { [weak self] detail in
                self?.state.send(.success(detail))
            }
            .store(in: &subscriptions)
    }
}
