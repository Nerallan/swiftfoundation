//
//  TestFieldsValidation.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation

class TestFieldsValidation {
    
    private var fieldValidator = FieldsValidator()
    
    func testValidationEmail(testEmail: String){
        print("is email \(testEmail) valid - \(fieldValidator.isValidEmail(emailString: testEmail))")
    }
    
    func testValidationLogin(testLogin: String){
        print("is login \(testLogin) valid - \(fieldValidator.isValidEmail(emailString: testLogin))")
    }
    
    func testValidationEmail(testPassword: String){
        print("is password \(testPassword) valid - \(fieldValidator.isValidEmail(emailString: testPassword))")
    }
}
