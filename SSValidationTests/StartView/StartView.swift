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
        VStack(spacing: 24) {
            SampleInput("Text", prompt: "Some text", viewModel: viewModel.textInput)
            SampleInput("Integer", prompt: "10", viewModel: viewModel.intInput)
            SampleInput("Double", prompt: "20.0", viewModel: viewModel.doubleInput)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

// MARK: - Preview

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
