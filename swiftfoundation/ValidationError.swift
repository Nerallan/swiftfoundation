//
//  ValidationError.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

enum EmailError: Error {
    case incorrectSymbol
    case unexpected
}

enum ValidationError: Error {
    case incorrect
    case unexpected
}

extension ValidationError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .incorrect:
            return "The provided field is not valid."
        case .unexpected:
            return "An unexpected error occurred."
        }
    }
}
