//
//  TextInputTests.swift
//  SSValidationTestsUITests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest
@testable import SSValidation
@testable import SSValidationTests

final class TextInputTests: XCTestCase, Steps {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.staticTexts["Text input"].tap()
    }
}
