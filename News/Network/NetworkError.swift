//
//  NetworkError.swift
//  News
//
//  Created by Ece Akcay on 16.12.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case decodingError
    case requestFailedWith(Int)
    case invalidResponse
    case customError(Error)
    
    var localizedDescription: String {
         switch self {
         case .invalidRequest:
              "Invalid request."
         case .decodingError:
             "Decoding error."
         case .requestFailedWith(let code):
             "Request failed with status code: \(code)."
        case .invalidResponse:
             "Invalid response." 
         case .customError(let error):
             "An error occured: \(error.localizedDescription)."
         
        }
    }
}
