//
//  NetworkRequestHandler.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Foundation

protocol NetworkRequestHandler {
    func perform(_ request: URLRequest) -> URLSession.DataTaskPublisher
    func perform(_ url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask
}
