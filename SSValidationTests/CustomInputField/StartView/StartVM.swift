//
//  StartVM.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSValidation
import SSUtils

final class StartVM: ObservableObject, CombineHelper {
    static let shared = StartVM()

    var cancellables: Set<AnyCancellable> = []

    @Published var textInput = TextInputVM()
    @Published var doubleInput = DoubleInputVM()
    @Published var intInput = IntInputVM()

    @Published private(set) var model = SampleModel()

    private init() {
        textInput.assignResult(to: \.model.text, on: self)
        doubleInput.assignResult(to: \.model.double, on: self)
        intInput.assignResult(to: \.model.int, on: self)
    }
}
