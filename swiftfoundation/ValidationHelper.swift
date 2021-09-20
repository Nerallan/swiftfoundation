//
//  FieldsValidator.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation


struct RegexValidator: FieldValidator {
    
    let regexPattern: String
    
    func validate(text source: String) -> Bool {
        var isValid = false
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let sourceRange = NSRange(source.startIndex..<source.endIndex, in: source)
            let results = regex.matches(in: source, range: sourceRange)
            
            isValid = results.count != 0
        
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
        }
        return isValid
    }
}


class ValidationHelper  {
    
    func isValidByCharacterSet(source: String, specialCharacters: CharacterSet) -> Bool {
        var isValid = false
        if source.rangeOfCharacter(from: specialCharacters) != nil {
            isValid = true
        }
        return isValid
    }
    
    func isValidByRegex(source: String, regexPattern: String) -> Bool {
        var isValid = false
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let sourceRange = NSRange(source.startIndex..<source.endIndex, in: source)
            let results = regex.matches(in: source, range: sourceRange)
            
            isValid = results.count != 0
        
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
        }
        return isValid
    }
    
    func isValidByRange(source: String, regexPattern: String) -> Bool {
        let result = source.range(
            of: regexPattern,
            options: .regularExpression
        )

        let isValid = (result != nil)
        return isValid
    }
}

extension String {
    func isValidByExtension(regexPattern: String) -> Bool {
        let result = self.range(
            of: regexPattern,
            options: .regularExpression
        )
        return (result != nil)
    }
}
