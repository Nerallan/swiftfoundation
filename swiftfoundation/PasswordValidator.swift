//
//  PasswordValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class PasswordValidator: FieldValidator {
    
    var validatorHelper: ValidationHelper = ValidationHelper()
    
    // Пароль (От 8 до 14 символов,  допустимые символы: цифры, буквы, специальные символы (выбери любые сам),
    // обязательные правила: минимум 1 буква большая, минимум 1 буква маленькая, минимум 1 цифра, минимум 1 специальный символ)+
    // positive look ahead
    func validate(text: String) -> Bool {
        let regexPatternPassword =
            // from 8 to 14 characters
            #"(?=.{8,14})"# +

            // At least one capital letter
            #"(?=.*[A-Z])"# +
                
            // At least one lowercase letter
            #"(?=.*[a-z])"# +
                
            // At least one digit
            #"(?=.*\d)"# +
                
            // At least one special character
            #"(?=.*[!$%&?._-])"#
        return validatorHelper.isValidByRegex(source: text, regexPattern: regexPatternPassword)
    }
}
