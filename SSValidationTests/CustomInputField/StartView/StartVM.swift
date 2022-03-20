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
    private var cancellables: Set<AnyCancellable> = []

    @Published var textInput = TextInputVM()
    @Published var doubleInput = DoubleInputVM()
    @Published var intInput = IntInputVM()

    @Published private(set) var model = SampleModel()

    init() {
        Publishers.CombineLatest3(textInput.result(), doubleInput.result(), intInput.result())
            .sink { [weak self] text, double, int in
                self?.model = .init(text: text, double: double, int: int)
            }
            .store(in: &cancellables)
    }
}
