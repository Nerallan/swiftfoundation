//
//  FieldValidator.swift
//  swiftfoundation
//
//  Created by User on 8/31/21.
//

import Foundation

protocol FieldValidator {
    var validatorHelper: ValidationHelper { get }
    func validate(text: String) -> Bool
}
