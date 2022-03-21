//
//  DoubleInputBaseTests.swift
//  SSValidationUnitTests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest
@testable import SSValidation

class DoubleInputBaseTests: XCTestCase, InputTestSteps {

    var input: InputVM<Double>!

    // MARK: - Tests

    func test_drop_first() throws {
        // Given: The field should not be empty, and should skip the first validation.
        let settings = InputSettings(dropFirst: true, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be nil.
        resultIsNil()
    }

    func test_do_not_drop_first() throws {
        // Given: The field should not be empty, and should not skip the first validation.
        let settings = InputSettings(dropFirst: false, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message "Field can not be empty." should be presented
        hasValidationMessage(ValidationMessage.empty)

        // and the result should be nil.
        resultIsNil()
    }

    func test_always_valid() throws {
        // Given: The field should always be valid, and should not skip the first validation.
        let settings = InputSettings(dropFirst: false, validator: .alwaysValid())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be nil.
        resultIsNil()
    }

    func test_not_empty() throws {
        // Given: The field should not be empty.
        let settings = InputSettings(validator: .notEmpty())

        // When: We initialize the input field
        initializeWithSettings(settings)

        // and we enter empty text.
        enterText("")

        // Then: Validation message "Field can not be empty." should be presented
        hasValidationMessage(ValidationMessage.empty)

        // and the result should be nil.
        resultIsNil()

        // When: We enter value "10".
        enterText("10")

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be "10.0".
        resultValue(is: 10)
    }
}

// MARK: - Steps

private extension DoubleInputBaseTests {
    func initializeWithSettings(_ settings: InputSettings) {
        input = DoubleInputVM(with: settings)
    }
}
