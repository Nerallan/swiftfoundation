//
//  RegexValidator.swift
//  swiftfoundation
//
//  Created by User on 9/21/21.
//

import Foundation

struct RegexValidator: FieldValidator {
    
    let regexPattern: String
    
    func validate(text source: String) throws  {
        let regex = try NSRegularExpression(pattern: regexPattern, options: [])
        let sourceRange = NSRange(source.startIndex..<source.endIndex, in: source)
        let results = regex.matches(in: source, range: sourceRange)
        
        guard results.count != 0 else {
            throw ValidationError.incorrect
        }
    }
}
