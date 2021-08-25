//
//  FieldsValidator.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation


class FieldsValidator  {
    
    let regexPatternEmail = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    
    // Email (Любой стандартный вид -- загуглить)
//    func isValidEmail(emailString: String) -> Bool {
//        var isValid = false
//
//        do {
//
//            let regex = try NSRegularExpression(pattern: regexPatternEmail, options: [])
//            let nsEmailString = emailString as NSString
//            let results = regex.matches(in: emailString, range: NSRange(location: 0, length: nsEmailString.length))
//
//            isValid = results.count != 0
//
//        } catch let error as NSError {
//            print("invalid regex: \(error.localizedDescription)")
//            isValid = false
//        }
//        return isValid
//    }
    
    func isValidEmail(emailString: String) -> Bool {
        var isValid = false
        
        do {
        
            let emailRegex = try NSRegularExpression(pattern: regexPatternEmail, options: [])
//            let nsEmailString = emailString as NSString
         
            let sourceRange = NSRange(emailString.startIndex..<emailString.endIndex, in: emailString)
            let results = emailRegex.matches(in: emailString, range: sourceRange)
            
            isValid = results.count != 0
        
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            isValid = false
        }
        return isValid
    }
    
    
    // Логин (Больше 5 символов, допустимые символы: цифры, буквы, нижнее подчеркивание “_”)
//    func isValidLogin(login: String) -> Bool {
//        let minSymbolsCount = 5
//        if login.count > minSymbolsCount && login.contains(<#T##element: Character##Character#>)
//    }

    // Пароль (От 8 до 14 символов,  допустимые символы: цифры, буквы, специальные символы (выбери любые сам),
    // обязательные правила: минимум 1 буква большая, минимум 1 буква маленькая, минимум 1 цифра, минимум 1 специальный символ)
//    func isValidPassword(password: String) -> Bool {
//        var isValid = false
//    }
}
