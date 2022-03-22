//
//  InputTestSteps.swift
//  SSValidationUnitTests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest
@testable import SSValidation

protocol InputTestSteps {
    associatedtype Result: Equatable

    var input: InputVM<Result>! { get set }
}

extension InputTestSteps {

    func enterText(_ text: String) {
        input.setAllowedText(to: text)
    }

    func resultIsNil() {
        resultValue(is: nil)
    }

    func resultValue(is value: Result?) {
        XCTAssertEqual(input.resultValue, value)
    }

    func hasNoValidationMessage() {
        XCTAssertEqual(input.validationMessage, nil)
    }

    func hasValidationMessage(_ message: String) {
        XCTAssertEqual(input.validationMessage, message)
    }
}
