//
//  APIServiceContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Foundation
import Combine

protocol APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder
    ) -> AnyPublisher<T, BaseError>
}

extension APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type
    ) -> AnyPublisher<T, BaseError> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: .init()
        )
    }
}
