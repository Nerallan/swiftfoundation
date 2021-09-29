//
//  RegexValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct RegexValidator: FieldValidator {
    
    let regexPattern: String
    
    func validate(text source: String) throws  {
        let regex = try NSRegularExpression(pattern: regexPattern, options: [])
        let sourceRange = NSRange(source.startIndex..<source.endIndex, in: source)
        let results = regex.matches(in: source, range: sourceRange)
        
        guard results.count != 0 else {
            throw ValidationError.incorrect
        }
    }
}

// Вместо Email валидатора внустри с использующимся регекс валидатором,
// создаем экстеншены с дефолтным регекс паатерном под каждый тип поля
extension RegexValidator {
    
    static let passwordRegex =
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
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
    static func createLogin(regex: String = "^[A-Za-z0-9_]{5,}$") -> RegexValidator {
        return RegexValidator(regexPattern: regex)
    }
    
    // Пароль (От 8 до 14 символов,  допустимые символы: цифры, буквы, специальные символы (выбери любые сам),
    // обязательные правила: минимум 1 буква большая, минимум 1 буква маленькая, минимум 1 цифра, минимум 1 специальный символ)+
    // positive look ahead
    static func createPassword(regex: String = passwordRegex) -> RegexValidator {
        return RegexValidator(regexPattern: regex)
    }
    
    // Email (Любой стандартный вид -- загуглить)
    static func createEmail(regex: String = "^[A-Z0-9a-z-_]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$") -> RegexValidator {
        return RegexValidator(regexPattern: regex)
    }
    
    
    init(regexLogin: String = "^[A-Za-z0-9_]{5,}$") {
        self.init(regexPattern: regexLogin)
    }
    
    init(regexEmail: String = "^[A-Za-z0-9_]{5,}$") {
        self.init(regexPattern: regexEmail)
    }
    
    init(regexPassword: String = "^[A-Za-z0-9_]{5,}$") {
        self.regexPattern = regexPassword
    }
}



