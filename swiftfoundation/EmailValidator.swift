//
//  EmailValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class EmailValidator: FieldValidator {
    
    var validatorHelper: ValidationHelper = ValidationHelper()
    
    // Email (Любой стандартный вид -- загуглить)
    func validate(text: String) -> Bool {
        let regexPatternEmail = "^[A-Z0-9a-z-_]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$"
        return validatorHelper.isValidByRegex(source: text, regexPattern: regexPatternEmail)
    }
}
