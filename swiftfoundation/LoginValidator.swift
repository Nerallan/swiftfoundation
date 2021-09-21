//
//  LoginValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class LoginValidator {
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
    let regexPatternPassword = "^[A-Za-z0-9_]{5,}$"
    
    var fieldValidator: FieldValidator {
        set { }
        get {
            return RegexValidator(regexPattern: regexPatternPassword)
        }
    }
    
    init(validatorType: FieldValidator) {
        self.fieldValidator = validatorType
    }
    
    func validate(text: String) throws {
        try fieldValidator.validate(text: text)
    }
}
