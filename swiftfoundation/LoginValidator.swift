//
//  LoginValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class LoginValidator: FieldValidator {
    
    var validatorHelper: ValidationHelper = ValidationHelper()
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
    func validate(text: String) -> Bool {
        let regexPatternLogin = "^[A-Za-z0-9_]{5,}$"
        return validatorHelper.isValidByRegex(source: text, regexPattern: regexPatternLogin)
    }
}
