//
//  BaseViewModel.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import Combine

protocol BaseViewModelContract {
    var subscriptions: Set<AnyCancellable> { get }
    var state: CurrentValueSubject<ViewModelState, Never> { get }
}

class BaseViewModel: BaseViewModelContract {
    var subscriptions: Set<AnyCancellable> = .init()
    let state: CurrentValueSubject<ViewModelState, Never> = .init(.loading)
    
    deinit {
        subscriptions.removeAll()
    }
}
