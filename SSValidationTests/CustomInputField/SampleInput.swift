//
//  SampleInput.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI
import SSValidation

struct SampleInput: View {

    private let title: String
    private let prompt: String
    @ObservedObject private var viewModel: InputVM

    init(_ title: String, prompt: String, viewModel: InputVM) {
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
            }
            if let message = viewModel.message {
                Text(message)
                    .font(.caption2)
                    .foregroundColor(.red)
            }
        }
    }
}

// MARK: - Preview

struct SampleInput_Previews: PreviewProvider {
    static var previews: some View {
        SampleInput("Double", prompt: "20.0", viewModel: InputVM())
            .padding().previewLayout(.sizeThatFits)
    }
}
