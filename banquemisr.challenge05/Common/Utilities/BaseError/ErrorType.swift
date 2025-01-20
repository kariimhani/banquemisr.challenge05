//
//  ErrorType.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

enum ErrorType {
    case connection
    case decoding
    case exception
    case unexpected
    case invalidData
}

extension ErrorType {
    var code: Int {
        switch self {
        case .connection: return 1
        case .decoding: return 2
        case .exception: return 3
        case .unexpected: return 4
        case .invalidData: return 5
        }
    }
    
    var message: String {
        switch self {
        case .connection: return "No Internet Connectin"
        case .decoding: return "Decoding Failure"
        case .exception: return "Exception"
        case .unexpected: return "Unexpected Failure"
        case .invalidData: return "No Data"
        }
    }
}
