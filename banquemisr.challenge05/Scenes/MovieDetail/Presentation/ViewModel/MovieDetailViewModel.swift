//
//  MovieDetailViewModel.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Foundation
import Combine

class MovieDetailViewModel: MovieDetailViewModelContract {
    private let movieId: Int
    private let useCase: GetMovieDetailUseCaseContract
    private var subscriptions: Set<AnyCancellable>
    
    var detail: PassthroughSubject<MovieDetailUIModel, Never>
    
    init(
        id: Int,
        useCase: GetMovieDetailUseCaseContract = GetMovieDetailUseCase()
    ) {
        self.useCase = useCase
        
        movieId = id
        subscriptions = .init()
        detail = .init()
    }
}

// MARK: - OUTPUTS


// MARK: - INPUTS

extension MovieDetailViewModel {
    func loadMovie() {
        useCase
            .execute(using: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completition in
                // TODO: - Handle Errors
            } receiveValue: { [weak self] detail in
                self?.detail.send(detail)
            }
            .store(in: &subscriptions)
    }
}
