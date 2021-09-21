//
//  CharacterSetValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct CharacterSetPasswordValidator: FieldValidator {

    func validate(text: String) throws {
        let minLength = 8
        let maxLength = 14
        let sourceCharacterSet = CharacterSet(charactersIn: text)
        if text.count < minLength || text.count > maxLength {
            throw ValidationError.incorrect
        }
        
        let specialCharacters = "!$%&?._-"

        let isLowercaseExist = !sourceCharacterSet.intersection(.lowercaseLetters).isEmpty
        let isUppercaseExist = !sourceCharacterSet.intersection(.uppercaseLetters).isEmpty
        let isDigitExist = !sourceCharacterSet.intersection(.decimalDigits).isEmpty
        let isSpecialCharacterExist = !sourceCharacterSet.intersection(CharacterSet(charactersIn: specialCharacters)).isEmpty

        guard isLowercaseExist && isUppercaseExist && isDigitExist && isSpecialCharacterExist else {
            throw ValidationError.incorrect
        }
    }
}
