//
//  FieldsValidator.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation


class FieldsValidator  {
    
    // Email (Любой стандартный вид -- загуглить)
    func isValidEmail(emailString: String) -> Bool {
        let regexPatternEmail = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        return isValidByRegex(source: emailString, regexPattern: regexPatternEmail)
    }
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
    func isValidLogin(login: String) -> Bool {
        let regexPatternLogin = "[A-Za-z0-9_]{5,}"
        return isValidByRegex(source: login, regexPattern: regexPatternLogin)
    }

    // Пароль (От 8 до 14 символов,  допустимые символы: цифры, буквы, специальные символы (выбери любые сам),
    // обязательные правила: минимум 1 буква большая, минимум 1 буква маленькая, минимум 1 цифра, минимум 1 специальный символ)
    func isValidPassword(password: String) -> Bool {
        // TODO write logic
        return false
    }
    
    private func isValidByRegex(source: String, regexPattern: String) -> Bool {
        var isValid = false
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let sourceRange = NSRange(source.startIndex..<source.endIndex, in: source)
            let results = regex.matches(in: source, range: sourceRange)
            
            isValid = results.count != 0
        
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
        }
        return isValid
    }
}
