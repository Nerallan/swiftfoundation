//
//  RangeValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct RangeValidator: FieldValidator {
    
    let regexPattern: String
    
    func validate(text source: String) throws  {
        let result = source.range(
            of: regexPattern,
            options: .regularExpression
        )

        guard (result != nil) else {
            throw ValidationError.incorrect
        }
    }
}
