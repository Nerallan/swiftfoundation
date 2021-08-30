//
//  main.swift
//  swiftfoundation
//
//  Created by User on 8/20/21.
//

import Foundation

//var testFields = TestFieldsValidation()
//testFields.testValidationEmail(testEmail: "hello@mail.ru")
//testFields.testValidationEmail(testEmail: "hello___12mail.ru")
//
//testFields.testValidationLogin(testLogin: "max")
//testFields.testValidationLogin(testLogin: "maxim12_")
//
//testFields.testValidationPassword(testPassword: "12314_")
//testFields.testValidationPassword(testPassword: "klaKzxc!_3")


//protocol Hello {
//
//    func printSmth(isDebug: Bool)
//}
//
//extension Hello {
//    func printSmth(isDebug: Bool = true) {
//        print("default impl:  \(isDebug)")
//    }
//}
//
//extension String: Hello {
//    func printSmth(isDebug: Bool = true) {
//        print("isDebug:  \(isDebug)")
//    }
//}
//
//extension Int: Hello {
//    func printSmth(isDebug: Bool = true) {
//        print("isDebug int:  \(isDebug)")
//    }
//}
//
//
//let a: String = "hi"
//let b: Hello = "help"
//let c: Hello = 5
//a.printSmth()
//b.printSmth(isDebug: true)
//c.printSmth(isDebug: false)


protocol ExampleProtocol {
    var simpleDescription: String { get set }
    func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    let id: UUID = UUID()
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription: String = a.simpleDescription
print(aDescription)

a.simpleDescription = "ahhhhh"
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var a = SimpleClass()
    func adjust() {
//        simpleDescription += " (adjusted)"
    }
}

struct SimpleNotMutatingStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    func adjust() {
//        simpleDescription += " (adjusted)"
        print(simpleDescription)
    }
}

var b = SimpleStructure()
b.adjust()
var bDescription = b.simpleDescription
print(b.a.id.uuidString)

b.simpleDescription = "ummmm"
print(b.a.id.uuidString)
//print(b.simpleDescription)
