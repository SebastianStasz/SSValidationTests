//
//  IntInputBaseTests.swift
//  SSValidationUnitTests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest
@testable import SSValidation

final class IntInputBaseTests: XCTestCase, InputTestSteps {

    var input: InputVM<Int>!

    // MARK: - Tests

    func test_valid_initial_value() throws {
        // Given: The field should have initial text "123", and should drop the first validation message.
        let settings = InputSettings(initialValue: "123", dropFirstValidationMessage: true, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be "123".
        resultValue(is: 123)
    }

    func test_invalid_initial_value() throws {
        // Given: The field should have initial text "123", and should drop the first validation message, and should be no less than 130.
        let settings = InputSettings(initialValue: "123", dropFirstValidationMessage: true, validator: .notEmpty().andDouble(.notLessThan(130)))

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be nill.
        resultIsNil()
    }

    func test_drop_first_validation_message() throws {
        // Given: The field should not be empty, and should skip the first validation message.
        let settings = InputSettings(dropFirstValidationMessage: true, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be nil.
        resultIsNil()
    }

    func test_do_not_drop_first_validation_message() throws {
        // Given: The field should not be empty, and should not skip the first validation message.
        let settings = InputSettings(dropFirstValidationMessage: false, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message "Field can not be empty." should be presented
        hasValidationMessage(ValidationMessage.empty)

        // and the result should be nil.
        resultIsNil()
    }

    func test_always_valid() throws {
        // Given: The field should always be valid, and should not skip the first validation message.
        let settings = InputSettings(dropFirstValidationMessage: false, validator: .alwaysValid())

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

        // and the result should be "10".
        resultValue(is: 10)
    }
    
}

// MARK: - Steps

private extension IntInputBaseTests {
    func initializeWithSettings(_ settings: InputSettings) {
        input = IntInputVM(with: settings)
    }
}
