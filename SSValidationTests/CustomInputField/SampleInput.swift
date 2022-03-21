//
//  SampleInput.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI
import SSValidation

struct SampleInput<T>: View {

    private let title: String
    private let prompt: String
    @ObservedObject private var viewModel: InputVM<T>

    init(_ title: String, prompt: String, viewModel: InputVM<T>) {
        self.title = title
        self.prompt = prompt
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .textCase(.uppercase)
                    .font(.caption)
                    .padding(.leading, 3)

                InputField(title, viewModel: viewModel, prompt: prompt)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("\(title)_input_field")
            }
            if let message = viewModel.validationMessage {
                Text(message)
                    .font(.caption2)
                    .foregroundColor(.red)
                    .accessibilityIdentifier("validation_message_identifier")
            }
        }
    }
}

// MARK: - Preview

struct SampleInput_Previews: PreviewProvider {
    static var previews: some View {
        SampleInput("Double", prompt: "20.0", viewModel: DoubleInputVM())
            .padding().previewLayout(.sizeThatFits)
    }
}
