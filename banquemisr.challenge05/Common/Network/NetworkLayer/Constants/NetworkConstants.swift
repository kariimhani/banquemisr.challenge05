//
//  NetworkConstants.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/20/25.
//

enum NetworkConstants {
    static let baseUrl: String = ConfigurationManager.shared.string(key: .baseUrl)
    
    static let apiKeyName: String = "api_key"
    static let apiKeyValue: String = ConfigurationManager.shared.string(key: .apiKey)
    
    static let contentTypeKey: String = "Content-Type"
    static let contentTypeValue: String = "application/json"
}
