//
//  FieldsValidator.swift
//  swiftfoundation
//
//  Created by User on 8/25/21.
//

import Foundation

extension String {
    func isValidByExtension(regexPattern: String) -> Bool {
        let result = self.range(
            of: regexPattern,
            options: .regularExpression
        )
        return (result != nil)
    }
}
