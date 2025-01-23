//
//  MoviesListViewModelContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Combine

typealias MoviesListViewModelContract = BaseViewModel & MoviesListViewModelOutput & MoviesListViewModelIntput

/// This protocol is used if your ViewModel contains Output
protocol MoviesListViewModelOutput {
    var title: String { get }
}

/// This protocol is used if your ViewModel contains Inputs
protocol MoviesListViewModelIntput {
    func loadMovies()
}
