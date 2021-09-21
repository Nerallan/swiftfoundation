//
//  EmailValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class EmailValidator {
    
    // Email (Любой стандартный вид -- загуглить)
    let regexPatternEmail = "^[A-Z0-9a-z-_]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$"
    var fieldValidator: FieldValidator {
        set { }
        get {
            return RegexValidator(regexPattern: regexPatternEmail)
        }
    }
    
    func validate(text: String) -> Bool {
        return fieldValidator.validate(text: text)
    }
}
