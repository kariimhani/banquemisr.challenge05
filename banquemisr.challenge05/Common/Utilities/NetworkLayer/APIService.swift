//
//  APIService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Foundation
import Combine

final class APIService: APIServiceContract {
    private let networkHandler: NetworkRequestHandler
    private let serviceQueue: DispatchQueue
    
    init(networkHandler: NetworkRequestHandler = URLSession.shared) {
        self.serviceQueue = .init(
            label: "banquemisr.challenge05.api-service",
            qos: .userInteractive,
            attributes: .concurrent
        )
        
        self.networkHandler = networkHandler
    }
    
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, BaseError> {
        networkHandler
            .perform(request)
            .receive(on: serviceQueue)
            .tryMap { response in
                guard let httpResponse = response.response as? HTTPURLResponse
                else {
                    throw BaseError(type: .invalidResponse)
                }
                
                switch httpResponse.statusCode {
                case 200...299: return response.data
                case 400: throw BaseError(type: .badRequest)
                case 401: throw BaseError(type: .unauthorized)
                case 403: throw BaseError(type: .forbidden)
                case 404: throw BaseError(type: .notFound)
                case 500...599: throw BaseError(type: .serverError)
                    
                default: throw BaseError(type: .unexpected)
                }
            }
            .decode(type: responseType, decoder: decoder)
            .mapError(handleError(using:))
            .eraseToAnyPublisher()
    }
}

private extension APIService {
    func handleError(using error: Error) -> BaseError {
        switch error {
        case URLError.networkConnectionLost,
            URLError.notConnectedToInternet:
            return .init(type: .noInternetConnection)
            
        case is DecodingError:
            return .init(type: .decoding)
            
        default:
            guard let baseError = error as? BaseError
            else {
                return .init(type: .unexpected)
            }
            
            return baseError
        }
    }
}
