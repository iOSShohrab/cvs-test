//
//  CSServiceError.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

public enum CSWebServiceError: Error {
    case error(message: String)
    case httpCode(statusCode: Int)
    case network
    case fetch
    case decode
    case other
    
    var reason: String {
        switch self {
        case .error(let message):
            return message
        case .httpCode(let statusCode):
            return "The call failed with HTTP code \(statusCode)"
        case .network:
            return "The internet connection is lost"
        case .fetch:
            return"Failed to fetch data"
        case .decode:
            return "Failed to decode json"
        case .other:
            return "Unfortunately something went wrong"
        }
    }
}
