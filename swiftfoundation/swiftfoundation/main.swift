//
//  main.swift
//  swiftfoundation
//
//  Created by User on 8/20/21.
//

import Foundation

var testFields = TestFieldsValidation()
testFields.testValidationEmail(testEmail: "hello@mail.ru")
testFields.testValidationEmail(testEmail: "hello___12mail.ru")

testFields.testValidationLogin(testLogin: "max")
testFields.testValidationLogin(testLogin: "maxim12_")

testFields.testValidationPassword(testPassword: "12314_") 
testFields.testValidationPassword(testPassword: "klaKzxc!_3")
