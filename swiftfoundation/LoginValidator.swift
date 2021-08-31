//
//  LoginValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class LoginValidator: FieldValidator {
    
    var validatorHelper: ValidationHelper = ValidationHelper()
    
    var validatorType: ValidationType
    
    init(validatorType: ValidationType = .byRegex) {
        self.validatorType = validatorType
    }
    
    func validate(text: String) -> Bool {
        switch validatorType {
        case .byRegex:
            return validateByRegex(text: text)
        case .bySymbolComparison:
            return validateBySymbolComparison(text: text)
        default:
            return true
        }
    }
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
    func validateByRegex(text: String) -> Bool {
        let regexPatternLogin = "^[A-Za-z0-9_]{5,}$"
        return validatorHelper.isValidByRegex(source: text, regexPattern: regexPatternLogin)
    }
    
    func validateBySymbolComparison(text: String) -> Bool {
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
