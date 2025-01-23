//
//  MovieDetailViewModelContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/22/25.
//

import Combine

typealias MovieDetailViewModelContract = BaseViewModel & MovieDetailViewModelIntput

/// This protocol is used if your ViewModel contains Inputs
protocol MovieDetailViewModelIntput {
    func loadMovie()
}
