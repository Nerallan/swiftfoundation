//
//  RangeValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct RangeValidator: FieldValidator {
    
    let regexPattern: String
    
    func validate(text source: String) -> Bool {
        let result = source.range(
            of: regexPattern,
            options: .regularExpression
        )

        let isValid = (result != nil)
        return isValid
    }
}
