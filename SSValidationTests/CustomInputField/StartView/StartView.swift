//
//  StartView.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI
import SSValidation

struct StartView: View {

    @StateObject private var viewModel = StartVM.shared

    var body: some View {
        Form {
            NavigationLink("Text input", destination: SampleInputView(type: .text))
            NavigationLink("Double input", destination: SampleInputView(type: .double))
            NavigationLink("Int input", destination: SampleInputView(type: .int))
        }
        .embedInNavigationView(title: "Input fields")
        .environmentObject(viewModel)
    }
}

// MARK: - Preview

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
