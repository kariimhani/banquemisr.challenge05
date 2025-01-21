//
//  BaseError.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

struct BaseError: Error {
    let code: Int
    let message: String
    let type: BaseErrorType
    
    init(type: BaseErrorType) {
        self.code = type.code
        self.message = type.message
        self.type = type
    }
}

extension BaseError: Equatable {}
