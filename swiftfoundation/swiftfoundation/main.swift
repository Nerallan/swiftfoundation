//
//  main.swift
//  swiftfoundation
//
//  Created by User on 8/20/21.
//

import Foundation

var testFields = TestFieldsValidation()
testFields.testValidationEmail(testEmail: "hello@mail.ru")


//protocol ExampleProtocol {
//    var simpleDescription: String { get set }
//    mutating func adjust()
//}
//
//
//class SimpleClass: ExampleProtocol {
//    var simpleDescription: String = "A very simple class."
//    var anotherProperty: Int = 69105
//    func adjust() {
//        simpleDescription += "  Now 100% adjusted."
//    }
//}
//var a = SimpleClass()
//a.adjust()
//let aDescription = a.simpleDescription
//print(aDescription)
//
//a.simpleDescription = "ahhhhh"
//print(aDescription)
//
//struct SimpleStructure: ExampleProtocol {
//    var simpleDescription: String = "A simple structure"
//    mutating func adjust() {
//        simpleDescription += " (adjusted)"
//    }
//}
//var b = SimpleStructure()
//b.adjust()
//var bDescription = b.simpleDescription
//print(bDescription)
//
//b.simpleDescription = "ummmm"
//print(bDescription)
