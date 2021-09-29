//
//  EmailValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation



class EmailValidator {
    
    // Email (Любой стандартный вид -- загуглить)

    static let regexPatternEmail = "^[A-Z0-9a-z-_]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$"
    
    private let fieldValidator: FieldValidator
    
    init(fieldValidator: FieldValidator = RegexValidator(regexPattern: regexPatternEmail)) {
        self.fieldValidator = fieldValidator
    }
    
    func validate(text: String) throws {
        try fieldValidator.validate(text: text)
    }
}


