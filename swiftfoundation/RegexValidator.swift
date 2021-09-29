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
    
    static func createLogin(regex: String = "^[A-Za-z0-9_]{5,}$") -> RegexValidator {
        return RegexValidator(regexPattern: regex)
    }
    
    static func createPassword(regex: String = "^[A-Za-z0-9_]{5,}$") -> RegexValidator {
        return RegexValidator(regexPattern: regex)
    }
    
    static func createEmail(regex: String = "^[A-Za-z0-9_]{5,}$") -> RegexValidator {
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
