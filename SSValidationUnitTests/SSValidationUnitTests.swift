//
//  SSValidationUnitTests.swift
//  SSValidationUnitTests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Combine
import XCTest
@testable import SSValidation

class SSValidationUnitTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []
    private var result: String?
    private var doubleInput: DoubleInputVM = .init()

    override func setUpWithError() throws {
        doubleInput.$validationMessage.sink { [unowned self] result in
            self.result = result
        }
        .store(in: &cancellables)
    }

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

private extension SSValidationUnitTests {

    func initializeWithSettings(_ settings: InputSettings) {
        doubleInput = .init(with: settings)
    }

    func enterText(_ text: String) {
        doubleInput.textInput = text
    }

    func resultIsNil() {
        resultValue(is: nil)
    }

    func resultValue(is value: Double?) {
        XCTAssertEqual(doubleInput.resultValue, value)
    }

    func hasNoValidationMessage() {
        XCTAssertEqual(doubleInput.validationMessage, nil)
    }

    func hasValidationMessage(_ message: String) {
        XCTAssertEqual(doubleInput.validationMessage, message)
    }
}
