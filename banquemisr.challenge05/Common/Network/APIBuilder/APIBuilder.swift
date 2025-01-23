//
//  APIBuilder.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

import Foundation

class APIBuilder {
    private(set) var urlRequest: URLRequest
    
    init(baseUrl: String = NetworkConstants.baseUrl) {
        guard let url = URL(string: baseUrl) else {
            fatalError("Could not create URL: \(baseUrl)")
        }
        
        urlRequest = URLRequest(url: url)
    }
    
    @discardableResult
    func setPath(using path: String) -> APIBuilder {
        urlRequest.url = urlRequest.url?.appendingPathComponent(path)
        return self
    }
    
    @discardableResult
    func setMethod(using method: HTTPMethod) -> APIBuilder {
        urlRequest.httpMethod = method.rawValue
        return self
    }
  
    func build() -> URLRequest {
        guard let url = urlRequest.url, !url.pathComponents.isEmpty else {
            fatalError("API should contain at least one path.")
        }
        
        let apiKeyQueryItem: URLQueryItem = .init(name: NetworkConstants.apiKeyName, value: NetworkConstants.apiKeyValue)
        urlRequest.url?.append(queryItems: [apiKeyQueryItem])
        
        urlRequest.setValue(NetworkConstants.contentTypeValue, forHTTPHeaderField: NetworkConstants.contentTypeKey)
        
        return urlRequest
    }
}
