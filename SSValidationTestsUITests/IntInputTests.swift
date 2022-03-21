//
//  IntInputTests.swift
//  SSValidationTestsUITests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest
@testable import SSValidation
@testable import SSValidationTests

final class IntInputTests: XCTestCase, Steps {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.staticTexts["Int input"].tap()
    }

    func test_entering_not_allowed_characters() throws {
        textField(enterText: "abc,.123")
        textField(shouldContains: "123")

        textField(enterText: "123..456.,")
        textField(shouldContains: "123456")

        textField(enterText: "123,,456.,")
        textField(shouldContains: "123456")
    }
}
