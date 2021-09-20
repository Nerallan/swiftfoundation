//
//  TestFieldsValidation.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation

class TestFieldsValidation {
    
    func startTestingFields() {
        executeEmailTests()
        print("-------------")
        print("Validation By regex")
        executeLoginTests(validationType: .byRegex)
        print("Validation By symbols comparison")
        executeLoginTests(validationType: .bySymbolComparison)
        print("-------------")
        print("Validation By regex")
        executePasswordTests(validationType: .byRegex)
        print("Validation By character set")
        executePasswordTests(validationType: .byCharacterSet)
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
        testValidationEmail(testEmail: "@@@hello_12@mail.com", expectedValue: false)
        testValidationEmail(testEmail: "hello_12@mail.com@@@", expectedValue: false)
    }
    
    private func executeLoginTests(validationType: ValidationType) {
        testValidationLogin(testLogin: "max", expectedValue: false, validationType: validationType)
        testValidationLogin(testLogin: "maxim12_", expectedValue: true, validationType: validationType)
        testValidationLogin(testLogin: "maxi4", expectedValue: true, validationType: validationType)
        testValidationLogin(testLogin: "          ", expectedValue: false, validationType: validationType)
        testValidationLogin(testLogin: "12345(", expectedValue: false, validationType: validationType)
        testValidationLogin(testLogin: "#maxim12", expectedValue: false, validationType: validationType)
    }
    
    private func executePasswordTests(validationType: ValidationType) {
        testValidationPassword(testPassword: "123456%78", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "1234567", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "12345678A", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "12AA", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "12314asda", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "!$!--Fkashd31k", expectedValue: true, validationType: validationType)
        testValidationPassword(testPassword: "kashdkjkh", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "klaPzxc!_3", expectedValue: true, validationType: validationType)
        testValidationPassword(testPassword: "111AAAaaaa", expectedValue: false, validationType: validationType)
        testValidationPassword(testPassword: "klazZxc!_30><<<~", expectedValue: false, validationType: validationType)
    }
    
    private func testValidationEmail(testEmail: String, expectedValue: Bool){
        let fieldValidator: FieldValidator = EmailValidator()
        let actualValue = fieldValidator.validate(text: testEmail)
        let resultValue = actualValue == expectedValue
        print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
    }
    
    private func testValidationLogin(testLogin: String, expectedValue: Bool, validationType: ValidationType = .byRegex){
        let fieldValidator: FieldValidator = LoginValidator(validatorType: validationType)
        let actualValue = fieldValidator.validate(text: testLogin)
        let resultValue = actualValue == expectedValue
        print("[login] \(testLogin) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
    }
    
    private func testValidationPassword(testPassword: String, expectedValue: Bool, validationType: ValidationType = .byRegex){
        let fieldValidator: FieldValidator = PasswordValidator(validatorType: validationType)
        let actualValue = fieldValidator.validate(text: testPassword)
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
