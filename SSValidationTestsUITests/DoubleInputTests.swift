//
//  DoubleInputTests.swift
//  SSValidationTestsUITests
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Combine
import XCTest
@testable import SSValidation
@testable import SSValidationTests

final class DoubleInputTests: XCTestCase, Steps {

    var app: XCUIApplication!

    private var doubleInput: DoubleInputVM {
        StartVM.shared.doubleInput
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.staticTexts["Double input"].tap()
    }

    func test_drop_first() throws {
        // Given: The field should not be empty, and should skip the first validation.
        let settings = InputSettings(dropFirstValidationMessage: true, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message should not be presented
        hasNoValidationMessage()

        // and the result should be nil.
        resultIsNil()
    }

    func test_do_not_drop_first() throws {
        // Given: The field should not be empty, and should not skip the first validation.
        let settings = InputSettings(dropFirstValidationMessage: false, validator: .notEmpty())

        // When: We initialize the input field.
        initializeWithSettings(settings)

        // Then: Validation message "Field can not be empty." should be presented
        hasValidationMessage(ValidationMessage.empty)

        // and the result should be nil.
        resultIsNil()
    }

    func test_always_valid() throws {
        // Given: The field should always be valid, and should not skip the first validation.
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

        // and we enter text "abc".
        textField(enterText: "abc")

        // Then: Validation with message "Field can not be empty." should be presented
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

private extension DoubleInputTests {

    func initializeWithSettings(_ settings: InputSettings) {
        StartVM.shared.doubleInput = .init(with: settings)
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
