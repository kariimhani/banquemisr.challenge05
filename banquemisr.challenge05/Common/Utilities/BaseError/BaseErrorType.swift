//
//  BaseErrorType.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

enum BaseErrorType {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case invalidResponse
    case noInternetConnection
    case decoding
    case unexpected
}

extension BaseErrorType {
    var code: Int {
        switch self {
        case .badRequest: return 400
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .serverError: return 500
        case .invalidResponse: return 2
        case .noInternetConnection: return 3
        case .decoding: return 4
        case .unexpected: return 5
        }
    }
    
    var message: String {
        switch self {
        case .badRequest:
            return "The request was invalid. Please check the syntax or parameters and try again."
            
        case .unauthorized:
            return "Authentication is required to access this resource. Please log in and try again."
            
        case .forbidden:
            return "You do not have permission to access this resource. Please check your access rights."
            
        case .notFound:
            return "The requested resource could not be found. Please check the URL or try again later."
            
        case .serverError:
            return "An internal server error occurred. Please try again later."
            
        case .invalidResponse:
            return "The response from the server is invalid or unexpected. Please try again later."
            
        case .noInternetConnection:
            return "No internet connection is available. Please check your network settings and try again."
            
        case .decoding:
            return "There was an error decoding the response data. Please try again later."
            
        case .unexpected:
            return "An unexpected error occurred. Please try again later or contact support if the issue persists."
        }
    }
}
