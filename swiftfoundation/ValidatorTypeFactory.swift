//
//  ValidatorTypeFactory.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

class ValidatorTypeFactory {
    
    func getValidatorByType(type: ValidationType) -> {
        switch type {
        case .byRegex:
            return RegexValidator()
        case .byCharacterSet:
            <#code#>
        default:
            <#code#>
        }
    }
}
