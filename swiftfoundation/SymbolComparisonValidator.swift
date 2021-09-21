//
//  SymbolComparisonValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct SymbolComparisonLoginValidator: FieldValidator {

    func validate(text: String) -> Bool {
        var correctSymbolCounter = 0
        let minSymbolLength = 5
        for scalar in text.unicodeScalars {
            let value = scalar.value
            let isDigit = (value >= 48 && value <= 57)
            let isLetter = (value >= 65 && value <= 90) || (value >= 97 && value <= 122)
            guard isDigit || isLetter || value == 95  else {
                return false
            }
            correctSymbolCounter += 1
        }
        return correctSymbolCounter >= minSymbolLength
    }
}
