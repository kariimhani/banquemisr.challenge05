//
//  MoviesListViewModelContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

typealias MoviesListViewModelContract = MoviesListViewModelOutput & MoviesListViewModelIntput

/// This protocol is used if your ViewModel contains Output
protocol MoviesListViewModelOutput {
}

/// This protocol is used if your ViewModel contains Inputs
protocol MoviesListViewModelIntput {
    func loadMovies()
}
