//
//  StartVM.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSValidation

final class StartVM: ObservableObject {
    static let shared = StartVM()

    private var cancellables: Set<AnyCancellable> = []

    @Published var textInput = TextInputVM()
    @Published var doubleInput = DoubleInputVM()
    @Published var intInput = IntInputVM()

    @Published private(set) var model = SampleModel()

    private init() {
        SampleModel.bind(text: textInput, double: doubleInput, int: intInput)
            .assign(to: &$model)
    }
}
