//
//  PasswordValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class PasswordValidator: FieldValidator {
    
    var validatorHelper: ValidationHelper = ValidationHelper()
    
    var validatorType: ValidationType
    
    init(validatorType: ValidationType = .byRegex) {
        self.validatorType = validatorType
    }
    
    // Пароль (От 8 до 14 символов,  допустимые символы: цифры, буквы, специальные символы (выбери любые сам),
    // обязательные правила: минимум 1 буква большая, минимум 1 буква маленькая, минимум 1 цифра, минимум 1 специальный символ)+
    // positive look ahead
    func validate(text: String) -> Bool {
        switch validatorType {
        case .byRegex:
            return validateByRegex(text: text)
        case .byCharacterSet:
            return validateByCharacterSet(text: text)
        default:
            return true
        }
    }
    
    private func validateByRegex(text: String) -> Bool {
        let regexPatternPassword =
    
            // At least one capital letter
            "^(?=.*[A-Z])" +
                
            // At least one lowercase letter
            "(?=.*[a-z])" +
                
            // At least one digit
            "(?=.*\\d)" +
                
            // At least one special character
            "(?=.*[!$%&?._-])" +
        
            // from 8 to 14 characters
            ".{8,14}$"
        return validatorHelper.isValidByRegex(source: text, regexPattern: regexPatternPassword)
    }
    
    private func validateByCharacterSet(text: String) -> Bool {
        let minLength = 8
        let maxLength = 14
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!$%&?._-"
        if text.count < minLength || text.count > maxLength {
            return false
        }
        
        var allowed = CharacterSet(charactersIn: alphabet)
//        allowed.formUnion(.lowercaseLetters)
//        allowed.formUnion(.uppercaseLetters)
//        allowed.formUnion(.decimalDigits)
//        allowed.formUnion(CharacterSet(charactersIn: "!$%&?._-"))
        print("HELLO \(allowed.description) WORLD")
        
        return validatorHelper.isValidByCharacterSet(source: text, specialCharacters: allowed)
    }
}
