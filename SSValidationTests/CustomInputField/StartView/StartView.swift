//
//  StartView.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI
import SSValidation

struct StartView: View {

    @StateObject private var viewModel = StartVM()

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Text result: \(textResult)")
            Text("Double result: \(doubleResult)")
            Text("Int result: \(intResult)")

            Spacer()

            SampleInput("Text", prompt: "Some text", viewModel: viewModel.textInput)
            SampleInput("Double", prompt: "20.0", viewModel: viewModel.doubleInput)
            SampleInput("Integer", prompt: "10", viewModel: viewModel.intInput)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }

    private var textResult: String {
        viewModel.sampleModel.textValue ?? ""
    }

    private var doubleResult: String {
        guard let double = viewModel.sampleModel.doubleValue else { return "" }
        return double.asString
    }

    private var intResult: String {
        guard let int = viewModel.sampleModel.intValue else { return "" }
        return int.asString
    }
}

// MARK: - Preview

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
