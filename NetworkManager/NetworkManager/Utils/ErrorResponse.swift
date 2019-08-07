//
//  ErrorResponse.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

public struct ErrorHelper {
    public static func error(for errorType: ErrorType, andMessage message: String) -> ErrorResponse {
        var error = ErrorResponse()
        error.type = errorType
        error.message = message
        return error
    }
}

public enum ErrorType {
    case unknown
    case notFound
    case serializationError
}

public struct ErrorResponse: Error {
    public var type: ErrorType
    public var message: String
    public var errorCode: String
    public var messageCode: String
    
    init() {
        type = .unknown
        message = ""
        errorCode = ""
        messageCode = ""
    }
}
