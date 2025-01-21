//
//  ConfigurationManager.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import Foundation

final class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    public enum UserDefined: String {
        case baseUrl = "BASE_URL"
        case apiKey = "API_KEY"
        case imageHost = "IMAGE_HOST"
    }
    
    private var infoDict: [String: Any]
    
    private init() {
        if let dict = Bundle.main.infoDictionary {
            infoDict = dict
        } else {
            fatalError("Couldn't find plist file")
        }
    }
    
    func string(key: UserDefined) -> String {
        guard let value = infoDict[key.rawValue] as? String
        else {
            fatalError("ConfigurationManager: couldn't find \(key.rawValue) key")
        }
        
        return value
    }
}
