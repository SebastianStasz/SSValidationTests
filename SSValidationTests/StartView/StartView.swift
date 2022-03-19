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
        VStack {
            InputField("Text", viewModel: viewModel.textInput)
            InputField("Integer", viewModel: viewModel.intInput)
            InputField("Double", viewModel: viewModel.doubleInput)
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
