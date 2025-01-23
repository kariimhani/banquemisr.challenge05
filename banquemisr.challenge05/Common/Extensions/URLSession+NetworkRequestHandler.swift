//
//  URLSession+NetworkRequestHandler.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Foundation.NSURLSession

extension URLSession: NetworkRequestHandler {
    func perform(_ request: URLRequest) -> URLSession.DataTaskPublisher {
        dataTaskPublisher(for: request)
    }
    
    func perform(_ url: URL, completionHandler: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask {
        dataTask(with: url, completionHandler: completionHandler)
    }
}
