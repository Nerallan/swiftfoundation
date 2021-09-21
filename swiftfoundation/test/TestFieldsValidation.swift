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
        executeLoginTests(fieldValidator: RegexValidator(regexPattern: "^[A-Za-z0-9_]{5,}$"))
        print("Validation By symbols comparison")
        executeLoginTests(fieldValidator: SymbolComparisonLoginValidator())
        print("-------------")
        print("Validation By regex")
        let regexPatternPassword =

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
        executePasswordTests(fieldValidator: RegexValidator(regexPattern: regexPatternPassword))
        print("Validation By character set")
        executePasswordTests(fieldValidator: CharacterSetPasswordValidator())
    }
    
    private func executeEmailTests() {
        testValidationEmail(testEmail: "hello!@mail.ru", expectedValue: false)
        testValidationEmail(testEmail: "hello_12mail.com", expectedValue: false)
        testValidationEmail(testEmail: "hello_12@mail.com", expectedValue: true)
        testValidationEmail(testEmail: "hello@mail4-.ru", expectedValue: true)
        testValidationEmail(testEmail: "hello@mail4?.ru", expectedValue: false)
        testValidationEmail(testEmail: "hello@mail.66", expectedValue: false)
        testValidationEmail(testEmail: "привет@мейл.66", expectedValue: false)
        testValidationEmail(testEmail: "h@h.bybyby", expectedValue: false)
        testValidationEmail(testEmail: "@@@hello_12@mail.com", expectedValue: false)
        testValidationEmail(testEmail: "hello_12@mail.com@@@", expectedValue: false)
    }
    
    private func executeLoginTests(fieldValidator: FieldValidator) {
        testValidationLogin(testLogin: "max", expectedValue: false, fieldValidator: fieldValidator)
        testValidationLogin(testLogin: "maxim12_", expectedValue: true, fieldValidator: fieldValidator)
        testValidationLogin(testLogin: "maxi4", expectedValue: true, fieldValidator: fieldValidator)
        testValidationLogin(testLogin: "          ", expectedValue: false, fieldValidator: fieldValidator)
        testValidationLogin(testLogin: "12345(", expectedValue: false, fieldValidator: fieldValidator)
        testValidationLogin(testLogin: "#maxim12", expectedValue: false, fieldValidator: fieldValidator)
    }

    private func executePasswordTests(fieldValidator: FieldValidator) {
        testValidationPassword(testPassword: "123456%78", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "1234567", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "12345678A", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "12AA", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "12314asda", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "!$!--Fkashd31k", expectedValue: true, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "kashdkjkh", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "klaPzxc!_3", expectedValue: true, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "111AAAaaaa", expectedValue: false, fieldValidator: fieldValidator)
        testValidationPassword(testPassword: "klazZxc!_30><<<~", expectedValue: false, fieldValidator: fieldValidator)
    }
    
    private func testValidationEmail(testEmail: String, expectedValue: Bool){
        let emailValidator = EmailValidator()
        var actualValue = false
        do {
            try emailValidator.validate(text: testEmail)
            actualValue = true
            let resultValue = actualValue == expectedValue
            print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
        } catch let error as ValidationError {
            let resultValue = actualValue == expectedValue
            print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue)) - \(error.description)")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func testValidationLogin(testLogin: String, expectedValue: Bool, fieldValidator: FieldValidator){
//        let actualValue = fieldValidator.validate(text: testLogin)
//        let resultValue = actualValue == expectedValue
//        print("[login] \(testLogin) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
        
        var actualValue = false
        do {
            try fieldValidator.validate(text: testLogin)
            actualValue = true
            let resultValue = actualValue == expectedValue
            print("[login] \(testLogin) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
        } catch let error as ValidationError {
            let resultValue = actualValue == expectedValue
            print("[login] \(testLogin) | \(getCorrectTestEmoji(isResultsMathes: resultValue)) - \(error.description)")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func testValidationPassword(testPassword: String, expectedValue: Bool, fieldValidator: FieldValidator){
//        let actualValue = fieldValidator.validate(text: testPassword)
//        let resultValue = actualValue == expectedValue
//        print("[password] \(testPassword) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
        
        var actualValue = false
        do {
            try fieldValidator.validate(text: testPassword)
            actualValue = true
            let resultValue = actualValue == expectedValue
            print("[password] \(testPassword) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
        } catch let error as ValidationError {
            let resultValue = actualValue == expectedValue
            print("[password] \(testPassword) | \(getCorrectTestEmoji(isResultsMathes: resultValue)) - \(error.description)")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
//    private func handleError(makeValidation: () -> Void) {
//        var actualValue = false
//        do {
//            try makeValidation()
//            actualValue = true
//            let resultValue = actualValue == expectedValue
//            print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue))")
//        } catch ValidationError.incorrect {
//            let resultValue = actualValue == expectedValue
//            print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue)) - \(ValidationError.incorrect)")
//        } catch ValidationError.unexpected {
//            let resultValue = actualValue == expectedValue
//            print("[email] \(testEmail) | \(getCorrectTestEmoji(isResultsMathes: resultValue)) - \(ValidationError.unexpected)")
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
    
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
