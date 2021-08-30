//
//  TestFieldsValidation.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation

class TestFieldsValidation {
    
    private var fieldValidator = FieldsValidator()
    
    func startTestingFields() {
        executeEmailTests()
        print("-------------")
        executeLoginTests()
        print("-------------")
        executePasswordTests()
    }
    
    private func executeEmailTests() {
        testValidationEmail(testEmail: "hello!@mail.ru", expectedValue: false)
        testValidationEmail(testEmail: "hello_12mail.com", expectedValue: false)
        testValidationEmail(testEmail: "hello_12@mail.com", expectedValue: true)
        testValidationEmail(testEmail: "hello@mail4-.ru", expectedValue: true)
        testValidationEmail(testEmail: "hello@mail4?.ru", expectedValue: false)
        testValidationEmail(testEmail: "hello@mail.66", expectedValue: false)
        testValidationEmail(testEmail: "привет@мейл.66", expectedValue: false)
        testValidationEmail(testEmail: "h@h.byby", expectedValue: false)
    }
    
    private func executeLoginTests() {
        testValidationLogin(testLogin: "max", expectedValue: false)
        testValidationLogin(testLogin: "maxim12_", expectedValue: true)
        testValidationLogin(testLogin: "maxi4", expectedValue: true)
        testValidationLogin(testLogin: "          ", expectedValue: false)
        testValidationLogin(testLogin: "12345(", expectedValue: false)
        testValidationLogin(testLogin: "#maxim12", expectedValue: false)
    }
    
    private func executePasswordTests() {
        testValidationPassword(testPassword: "1234567", expectedValue: false)
        testValidationPassword(testPassword: "123456%78", expectedValue: false)
        testValidationPassword(testPassword: "12345678A", expectedValue: false)
        testValidationPassword(testPassword: "12AA", expectedValue: false)
        testValidationPassword(testPassword: "12314asda", expectedValue: false)
        testValidationPassword(testPassword: "!$!--Fkashd31k", expectedValue: true)
        testValidationPassword(testPassword: "kashdkjkh", expectedValue: false)
        testValidationPassword(testPassword: "klaKzxc!_3", expectedValue: true)
        testValidationPassword(testPassword: "111AAAaaaa", expectedValue: false)
        testValidationPassword(testPassword: "klazZxc!_30><<<~", expectedValue: true)
    }
    
    private func testValidationEmail(testEmail: String, expectedValue: Bool){
        let actualValue = fieldValidator.isValidEmail(emailString: testEmail)
        let resultValue = actualValue == expectedValue
        print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
    }
    
    private func testValidationLogin(testLogin: String, expectedValue: Bool){
        let actualValue = fieldValidator.isValidLogin(login: testLogin)
        let resultValue = actualValue == expectedValue
        print("[login] \(testLogin) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
    }
    
    private func testValidationPassword(testPassword: String, expectedValue: Bool){
        let actualValue = fieldValidator.isValidPassword(password: testPassword)
        let resultValue = actualValue == expectedValue
        print("[password] \(testPassword) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
    }
    
    private func getCorrectTestEmoji(isResultsMathes: Bool) -> String {
        var outputString = "validation guessed - "
        if isResultsMathes == true {
            outputString.append("✅")
        } else {
            outputString.append("❌")
        }
        return outputString
    }
}
