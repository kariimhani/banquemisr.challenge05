//
//  NetworkRequestHandler.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/21/25.
//

import Foundation

protocol NetworkRequestHandler {
    func perform(_ request: URLRequest) -> URLSession.DataTaskPublisher
}
