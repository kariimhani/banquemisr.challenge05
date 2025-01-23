//
//  MockAPIService.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import Foundation
@testable import banquemisr_challenge05
import Combine

class MockAPIService<Object: Decodable>: APIServiceContract {
    private let isSuccess: Bool
    private let object: Decodable
    
    init(
        isSuccess: Bool,
        object: Object
    ) {
        self.isSuccess = isSuccess
        self.object = object
    }
    
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder
    ) -> AnyPublisher<T, BaseError> {
        if isSuccess,
           let response = object as? T {
            return Just(response)
                .setFailureType(to: BaseError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: BaseError(type: .invalidResponse))
            .eraseToAnyPublisher()
    }
}
