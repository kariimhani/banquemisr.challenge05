//
//  ViewModelState.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

enum ViewModelState {
    case loading
    case success(_ data: Any)
    case failure(String)
}
