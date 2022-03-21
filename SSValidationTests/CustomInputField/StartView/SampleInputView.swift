//
//  SampleInputView.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import SwiftUI

struct SampleInputView: View {
    @EnvironmentObject private var viewModel: StartVM
    let type: InputFieldType

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            switch type {
            case .text:
                Text("Text result: \(textResult)")
                SampleInput("Text", prompt: "", viewModel: viewModel.textInput)
            case .double:
                Text("Double result: \(doubleResult)")
                SampleInput("Double", prompt: "", viewModel: viewModel.doubleInput)
            case .int:
                Text("Int result: \(intResult)")
                SampleInput("Integer", prompt: "", viewModel: viewModel.intInput)
            }
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }

    private var textResult: String {
        viewModel.model.text ?? ""
    }

    private var doubleResult: String {
        guard let double = viewModel.model.double else { return "" }
        return double.asString
    }

    private var intResult: String {
        guard let int = viewModel.model.int else { return "" }
        return int.asString
    }
}

// MARK: - Preview

struct SampleInputView_Previews: PreviewProvider {
    static var previews: some View {
        SampleInputView(type: .text)
    }
}
