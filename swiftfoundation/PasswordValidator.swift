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
//        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!$%&?._-"
        let sourceCharacterSet = CharacterSet(charactersIn: text)
        if text.count < minLength || text.count > maxLength {
            return false
        }
        
        let specialCharacters = "!$%&?._-"
//        var allowed = CharacterSet()
//        allowed.formUnion(.lowercaseLetters)
//        allowed.formUnion(.uppercaseLetters)
//        allowed.formUnion(.decimalDigits)
//
//        allowed.formUnion(CharacterSet(charactersIn: specialCharacters))
//
        let isLowercaseExist = !sourceCharacterSet.intersection(.lowercaseLetters).isEmpty
        let isUppercaseExist = !sourceCharacterSet.intersection(.uppercaseLetters).isEmpty
        let isDigitExist = !sourceCharacterSet.intersection(.decimalDigits).isEmpty
        let isSpecialCharacterExist = !sourceCharacterSet.intersection(CharacterSet(charactersIn: specialCharacters)).isEmpty
//        let isValid = isSymbolsExistInText(alphabet: .lowercaseLetters) && isSymbolsExistInText(alphabet: .uppercaseLetters) &&
//            isSymbolsExistInText(alphabet: .decimalDigits) && isSymbolsExistInText(alphabet: CharacterSet(charactersIn: specialCharacters))
        
        
//        let isValid = sourceCharacterSet.intersection(.lowercaseLetters).isEmpty ==  && sourceCharacterSet.intersection(.uppercaseLetters) && sourceCharacterSet.intersection(.decimalDigits) && sourceCharacterSet.intersection(CharacterSet(charactersIn: specialCharacters))
        let isValid = isLowercaseExist && isUppercaseExist && isDigitExist && isSpecialCharacterExist
        print("HELLO \(isValid) WORLD")
        return isValid
//        return validatorHelper.isValidByCharacterSet(source: text, specialCharacters: allowed)
    }
    
//    func isSymbolsExistInText(alphabet: CharacterSet) {
//        return sourceCharacterSet.intersection(.alphabet).isEmpty == false
//    }
//    private func generateSetFromAsciiRange(fromSymbol: String, toSymbol: String) -> Set<String> {
//        return (UInt8(ascii: "a")...UInt8(ascii: "z")).map { Character(UnicodeScalar($0) }.
//    }
}
