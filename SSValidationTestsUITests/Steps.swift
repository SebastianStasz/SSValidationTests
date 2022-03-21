//
//  Steps.swift
//  SSValidationTestsUITests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import XCTest

protocol Steps {
    var app: XCUIApplication! { get set }
}

extension Steps {
    func textField(hasValidationMessage message: String) {
        XCTAssert(app.staticTexts[message].exists)
    }

    func textFieldNoValidationMessage() {
        print(app.descendants(matching: .any)["validation_message_identifier"].label)
    }

    func textField(shouldContains text: String) {
        XCTAssertEqual(textField.value as? String, text)
    }

    func textField(enterText text: String) {
        textField.tap()
        textFieldClearText()
        textField.typeText(text)
    }

    func textFieldClearText() {
        guard (textField.value as! String).isNotEmpty else { return }
        textField.doubleTap()
        app.keys["delete"].tap()
    }

    var textField: XCUIElement {
        app.textFields.firstMatch
    }
}
