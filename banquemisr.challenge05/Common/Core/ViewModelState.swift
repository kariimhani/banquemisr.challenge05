//
//  ViewModelState.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import Foundation

enum ViewModelState {
    case loading
    case success(_ data: Any)
    case failure(String)
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.success(let lhsData), .success(let rhsData)): return (lhsData as? NSObject) == (rhsData as? NSObject)
        case (.failure(let lhsError), .failure(let rhsError)): return lhsError == rhsError
            
        default:
            return false
        }
    }
}
