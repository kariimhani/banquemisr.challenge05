//
//  MovieDetailViewModelContract.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import Combine

typealias MovieDetailViewModelContract = MovieDetailViewModelOutput & MovieDetailViewModelIntput

/// This protocol is used if your ViewModel contains Output
protocol MovieDetailViewModelOutput {
    var detail: PassthroughSubject<MovieDetailUIModel, Never> { get }
}

/// This protocol is used if your ViewModel contains Inputs
protocol MovieDetailViewModelIntput {
    func loadMovie()
}
