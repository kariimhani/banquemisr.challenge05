//
//  APIService.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Foundation
import Combine

final class APIService: NSObject,
                        APIServiceContract {
    /// Singleton instance of APIService class
    static let shared = APIService()

    private let serviceQueue: DispatchQueue
    
    private override init() {
        self.serviceQueue = .init(
            label: "banquemisr.challenge05.api-service",
            qos: .userInteractive,
            attributes: .concurrent
        )
        
        super.init()
    }
    
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init(),
        retry: Int = NetworkConstants.retries
    ) -> AnyPublisher<T, BaseError> {
        debugPrint("APIService is requesting: \(request)")
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: serviceQueue)
            .tryMap { response in
                guard let httpResponse = response.response as? HTTPURLResponse
                else {
                    throw URLError(.badServerResponse)
                }
                
                switch httpResponse.statusCode {
                case 200...299: return response.data
                default: break
                }
                
                throw BaseError(type: .unexpected)
            }
            .decode(type: responseType, decoder: decoder)
            .mapError(handleError(using:))
            .eraseToAnyPublisher()
    }
    
    func handleError(using error: Error) -> BaseError {
        print("APIService did throw error", error)
        
        switch error {
        case URLError.networkConnectionLost,
            URLError.notConnectedToInternet:
            return .init(type: .connection)
            
        case is URLError:
            return .init(type: .unexpected)
            
        case is DecodingError:
            return .init(type: .decoding)
            
        default:
            return .init(type: .unexpected)
        }
    }
}
